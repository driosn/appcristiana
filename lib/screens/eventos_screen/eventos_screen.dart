//From Flutter
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewEvent(context),
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      drawer: HomePage.createDrawer(context),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
                  child: ListView.builder(
                    itemCount: eventos.length,
                    itemBuilder: (context, position) {
                      return Column(
                        children: <Widget>[
                          CardItem('${eventos[position].urlImage}', '${eventos[position].titleEvent}', '${eventos[position].date}', AboutEventos('${eventos[position].titleEvent}', '${eventos[position].urlImage}', '${eventos[position].description}', '${eventos[position].information}')),
                          Divider(height: 10.0)
                        ],
                      );
                    }
          ),
        ),
      ),
    );
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
}