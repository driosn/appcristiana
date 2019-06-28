import 'package:flutter/material.dart';

import '../pagesTabs/descripcionIglesia_screen.dart';
import 'package:app_cristiana/screens/aboutIglesias_screen/pagesTabs/horariosIglesia_screen.dart';

import '../pagesTabs/descripcionIglesia_screen.dart' as descripcionIglesia;
import '../pagesTabs/horariosIglesia_screen.dart' as horariosIglesia;


class AboutIglesia extends StatefulWidget {
  
  String _tituloIglesia;
  String _imagenIglesia;
  String _descripcionIglesia;
  String _horariosIglesia;
  
  AboutIglesia(this._tituloIglesia, this._imagenIglesia, this._descripcionIglesia, this._horariosIglesia);

  @override
  _AboutIglesiaState createState() => _AboutIglesiaState();
}

class _AboutIglesiaState extends State<AboutIglesia> with SingleTickerProviderStateMixin {
  
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Iglesia'),
        bottom: new TabBar(
          controller: _controller,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.description)),
            new Tab(icon: Icon(Icons.alarm)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          new descripcionIglesia.DescripcionIglesia(widget._tituloIglesia, widget._imagenIglesia, widget._descripcionIglesia),
          new horariosIglesia.HorariosIglesia(widget._horariosIglesia)
        ],
      ),
    );
  }
}