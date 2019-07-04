import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:flutter/material.dart';

class TestHome extends StatefulWidget {
  
  UserDetails details;

  TestHome(this.details);
  
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(widget.details.userName),
          SizedBox(height: 15.0),
          Container(
            child: Image.network(
              widget.details.photoUser
            ),
          )
        ],
      ),
    );
  }
}