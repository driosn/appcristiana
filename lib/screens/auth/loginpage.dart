import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {
  
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if(validateAndSave()) {
      try {  
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        print('Signed in: ${user.uid}');
      }
      catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    setState(() {
    _formType = FormType.register;
    });
  }
  
  void moveToLogin() {
    setState(() {
    _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Inicio de Sesion'),
        backgroundColor: Colors.grey,
      ),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child: new Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons() 
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email no puede estar vacio' : null, 
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password no puede estar vacio' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if(_formType == FormType.login) {
      return [
         new RaisedButton(
           child: Text('Ingresar', style: TextStyle(fontSize: 20.0),),
           onPressed: validateAndSave,
         ),
         new FlatButton(
           child: Text('Crear una cuenta', style: TextStyle(fontSize: 20.0)),
           onPressed: moveToRegister,
         )
      ];
    } else {
        return[
          new RaisedButton(
            child: Text('Crear una cuenta', style: TextStyle(fontSize: 20.0),),
            onPressed: validateAndSubmit,
          ),
          new FlatButton(
            child: Text('Ya tienes una cuenta? Login', style: TextStyle(fontSize: 20.0)),
            onPressed: moveToLogin,
          )
        ];
    }
  }
}