import 'package:app_cristiana/screens/backstage_screen/backstage_screen.dart';
import 'package:app_cristiana/screens/blog_screen/blog_screen.dart';
import 'package:app_cristiana/screens/eventos_screen/eventos_screen.dart';
import 'package:app_cristiana/screens/iglesias_screen/iglesias_screen.dart';
import 'package:app_cristiana/screens/ubb_screen/ubb_screen.dart';
import 'package:app_cristiana/screens/ujblp_screen/ujblp_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/homepage/widgets/select_activity.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      drawer: createDrawer(context),
      body: createItems(),
    );
  }

  static Widget createDrawer(BuildContext context) {
    return Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Text('Bienvenido'),
                    SizedBox(height: 10.0),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/smile.png'),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Mi Cuenta'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configuraciones'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
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
                SelectActivity('Iglesias', 'assets/images/iglesia.jpg', 170.0, IglesiasScreen()),
                Expanded(child: SizedBox(width: 50.0))
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(child: SizedBox(width: 50.0)),
                SelectActivity('Radio', 'assets/images/radio.jpg', 340.0, null),
                Expanded(child: SizedBox(width: 50.0))
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(child: SizedBox(width: 50.0)),
                SelectActivity('Eventos', 'assets/images/eventos.jpg', 170.0, EventosScreen()),
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
                SelectActivity('Blog', 'assets/images/blog.jpeg', 170.0, BlogScreen()),
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