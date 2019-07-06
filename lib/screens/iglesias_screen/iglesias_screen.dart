import 'dart:async';

import 'package:app_cristiana/screens/aboutBlogs_screen/aboutBlog_screen.dart';
import 'package:app_cristiana/screens/aboutIglesias_screen/widgets/aboutIglesia_screen.dart';
import 'package:app_cristiana/screens/addScreens/add_iglesia.dart';
import 'package:app_cristiana/screens/auth/loginpage.dart';
import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:app_cristiana/screens/eventos_screen/widgets/card_item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_cristiana/models/iglesia_model.dart';

class IglesiasScreen extends StatefulWidget {

  UserDetails details;

  IglesiasScreen(this.details);

  @override
  _IglesiasScreenState createState() => _IglesiasScreenState();
}

final iglesiaReference = FirebaseDatabase.instance.reference().child('iglesia');

class _IglesiasScreenState extends State<IglesiasScreen> {
  
  List<Iglesia> iglesias;
  StreamSubscription<Event> _onIglesiaAddedSubscription;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iglesias = new List();
     _onIglesiaAddedSubscription = iglesiaReference.onChildAdded.listen(_onIglesiaAdded);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onIglesiaAddedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iglesias'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _createNewIglesia(context),
        onPressed: () {
          print(widget.details.userName);
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    widget.details.userName == null ? Text('${widget.details.userEmail}') : Text('${widget.details.userName}'),
                    SizedBox(height: 10.0),
                    CircleAvatar(
                      backgroundImage: widget.details.photoUser == null ? AssetImage('assets/images/smile.png') : NetworkImage('${widget.details.photoUser}'),
                      radius: 30.0,
                    ),
                    Expanded(child: SizedBox())
                  ],
                )
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context);
              },
            ),
            ListTile(
              title: Text('Cerrar Sesion'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  ModalRoute.withName('/'),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
                  child: ListView.builder(
                    itemCount: iglesias.length,
                    itemBuilder: (context, position) {
                      return Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[ 
                              CardItem('${iglesias[position].urlImage}', '${iglesias[position].titleIglesia}', '${iglesias[position].zona}', AboutIglesia('${iglesias[position].titleIglesia}', '${iglesias[position].urlImage}', '${iglesias[position].description}', '${iglesias[position].horarios}')),
                              Positioned(
                                left: 15.0,
                                top: 10.0,                 
                                child: widget.details.userName == 'David Rios' ?
                                  InkWell(
                                    child: Icon(
                                              Icons.delete,
                                              size: 40.0,
                                              color: Colors.black,
                                    ),
                                    onTap: () =>  _deleteIglesia(context, iglesias[position], position),
                                   ) : SizedBox(),
                              )
                            ],
                          ),
                          Divider(height: 10.0)
                        ],
                      );
                    }
          ),
        ),
      ),
    );
  }

  void _signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }

  void _onIglesiaAdded(Event event) {
    setState(() {
      iglesias.add(new Iglesia.fromSnapShot(event.snapshot));
    });
  }

  void _createNewIglesia(BuildContext context) async {
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => AddIglesia(Iglesia(null, '', '' ,'', '', '')))
    );
  }

  void _deleteIglesia(BuildContext context, Iglesia iglesia, int position) async {
    await iglesiaReference.child(iglesia.id).remove().then((_) {
      setState(() {
        iglesias.removeAt(position);
      });
    });
  }

}