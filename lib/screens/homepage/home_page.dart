import 'package:app_cristiana/screens/auth/loginpage.dart';
import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:app_cristiana/screens/backstage_screen/backstage_screen.dart';
import 'package:app_cristiana/screens/blog_screen/blog_screen.dart';
import 'package:app_cristiana/screens/eventos_screen/eventos_screen.dart';
import 'package:app_cristiana/screens/iglesias_screen/iglesias_screen.dart';
import 'package:app_cristiana/screens/radio_screen/radio_screen.dart';
import 'package:app_cristiana/screens/ubb_screen/ubb_screen.dart';
import 'package:app_cristiana/screens/ujblp_screen/ujblp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/homepage/widgets/select_activity.dart';

class HomePage extends StatelessWidget {
  
  UserDetails details;

  HomePage(this.details);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
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
                    Text('${this.details.userName}'),
                    SizedBox(height: 10.0),
                    CircleAvatar(
                      backgroundImage: this.details.photoUser == null ? AssetImage('assets/images/smile.png') : NetworkImage('${this.details.photoUser}'),
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
                Navigator.of(context)
                .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: createItems(),
    );
  }

  void _signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }

  Widget createItems() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Center(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: SizedBox(width: 50.0)),
                SelectActivity('', 'assets/images/backstage.jpg', 170.0, BackStageScreen()),
                Expanded(child: SizedBox()),
                SelectActivity('Iglesias', 'assets/images/iglesia.jpg', 170.0, IglesiasScreen(this.details)),
                Expanded(child: SizedBox(width: 50.0))
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(child: SizedBox(width: 50.0)),
                SelectActivity('Radio', 'assets/images/radio.jpg', 340.0, RadioScreen()),
                Expanded(child: SizedBox(width: 50.0))
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(child: SizedBox(width: 50.0)),
                SelectActivity('Eventos', 'assets/images/eventos.jpg', 170.0, EventosScreen(this.details)),
                Expanded(child: SizedBox()),
                SelectActivity('', 'assets/images/bautista.jpeg', 170.0, UbbScreen()),
                Expanded(child: SizedBox(width: 50.0))
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(child: SizedBox(width: 50.0)),
                SelectActivity('', 'assets/images/jovenes.jpg', 170.0, UjblpScreen()),
                Expanded(child: SizedBox()),
                SelectActivity('Blog', 'assets/images/blog.jpeg', 170.0, BlogScreen(this.details)),
                Expanded(child: SizedBox(width: 50.0))
              ],
            ),
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}