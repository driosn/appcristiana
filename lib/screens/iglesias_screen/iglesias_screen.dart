import 'dart:async';

import 'package:app_cristiana/screens/aboutBlogs_screen/aboutBlog_screen.dart';
import 'package:app_cristiana/screens/aboutIglesias_screen/widgets/aboutIglesia_screen.dart';
import 'package:app_cristiana/screens/addScreens/add_iglesia.dart';
import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:app_cristiana/screens/eventos_screen/widgets/card_item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_cristiana/models/iglesia_model.dart';

class IglesiasScreen extends StatefulWidget {
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
        onPressed: () => _createNewIglesia(context),
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      drawer: HomePage.createDrawer(context),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
                  child: ListView.builder(
                    itemCount: iglesias.length,
                    itemBuilder: (context, position) {
                      return Column(
                        children: <Widget>[
                          CardItem('${iglesias[position].urlImage}', '${iglesias[position].titleIglesia}', '${iglesias[position].zona}', AboutIglesia('${iglesias[position].titleIglesia}', '${iglesias[position].urlImage}', '${iglesias[position].description}', '${iglesias[position].horarios}')),
                          Divider(height: 10.0)
                        ],
                      );
                    }
          ),
        ),
      ),
    );
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

}