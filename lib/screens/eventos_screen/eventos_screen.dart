//From Flutter
import 'package:app_cristiana/screens/auth/loginpage.dart';
import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

//Widgets
import 'package:app_cristiana/screens/aboutBlogs_screen/aboutBlog_screen.dart';
import 'package:app_cristiana/screens/aboutEventos_screen/aboutEventos_screen.dart';
import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:app_cristiana/screens/eventos_screen/widgets/card_item.dart';
import 'package:app_cristiana/screens/addScreens/add_evento.dart';

//Models
import 'package:app_cristiana/models/event_model.dart';

class EventosScreen extends StatefulWidget {

  UserDetails details;

  EventosScreen(this.details);

  @override
  _EventosScreenState createState() => _EventosScreenState();
}

final eventReference = FirebaseDatabase.instance.reference().child('event');

class _EventosScreenState extends State<EventosScreen> {
 
  List<MyEvent> eventos;
  StreamSubscription<Event> _onEventAddedSubscription;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventos = new List();
    _onEventAddedSubscription = eventReference.onChildAdded.listen(_onEventAdded);
  }
 
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onEventAddedSubscription.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: widget.details.userName == 'ubbadmin@admin.com' ? FloatingActionButton(
        onPressed: () => _createNewEvent(context),
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ) : null,
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
                    itemCount: eventos.length,
                    itemBuilder: (context, position) {
                      return Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[ 
                              CardItem('${eventos[position].urlImage}', '${eventos[position].titleEvent}', '${eventos[position].date}', AboutEventos('${eventos[position].titleEvent}', '${eventos[position].urlImage}', '${eventos[position].description}', '${eventos[position].information}')),
                              Positioned(
                                left: 15.0,
                                top: 10.0,                 
                                child: widget.details.userName == 'ubbadmin@admin.com' ?
                                  InkWell(
                                    child: Icon(
                                              Icons.delete,
                                              size: 40.0,
                                              color: Colors.black,
                                    ),
                                    onTap: () =>  _deleteEvent(context, eventos[position], position),
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

  void _onEventAdded(Event event) {
    setState(() {
      eventos.add(new MyEvent.fromSnapShot(event.snapshot));
    });
  }

  void _createNewEvent(BuildContext context) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddEvento(MyEvent(null, '', '', '', '', '')))
    );
  }

  void _deleteEvent(BuildContext context, MyEvent event, int position) async {
    await eventReference.child(event.id).remove().then((_) {
      setState(() {
        eventos.removeAt(position);
      });
    });
  }
}