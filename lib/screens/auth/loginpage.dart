import 'package:app_cristiana/screens/auth/register_page.dart';
import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginPage extends StatefulWidget {
  
  final String title;  

  LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Iniciar Sesion'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email)
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15.0),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.vpn_key)
              ),
            ),
            SizedBox(height: 15.0),
            FlatButton(
              child: Text('Login'),
              color: Colors.orangeAccent,
              textColor: Colors.white,
              onPressed: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text
                ).then((FirebaseUser user){
                  //Ir a pagina
                  UserDetails details = new UserDetails(user.email, null, user.email);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(details))
                  ); 
                }).catchError((e) {
                  print(e);
                });
              },
            ),
            FlatButton(
              child: Text('Registrar'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            VerticalDivider(),
            GoogleSignInSection()
          ],
        ),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page){
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) => page)
    );
  }

}

class GoogleSignInSection extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _GoogleSignInSectionState();
}

class _GoogleSignInSectionState extends State<GoogleSignInSection> {
  
  bool _success;
  String _userID;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              GoogleSignInButton(onPressed: (){
                _signInWithGoogle();
              },)
            ],
          ),
        )
      ],
    );
  }

  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.displayName != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    UserDetails details = new UserDetails(user.displayName, user.photoUrl, user.email);

    setState(() {
      if(user != null) {
        _success = true;
        _userID = user.uid;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(details)
        ));
      }
    });
  }
}