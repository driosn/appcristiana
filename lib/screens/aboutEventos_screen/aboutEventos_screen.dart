import 'package:flutter/material.dart';

import './pagesTabs/descripcionEvento_screen.dart' as descripcionEvento;
import './pagesTabs/informacionEvento_screen.dart' as informacionEvento;

class AboutEventos extends StatefulWidget {

  String _tituloEvento;
  String _imagenEvento;
  String _descripcionEvento;
  String _informacionEvento;

  AboutEventos(this._tituloEvento, this._imagenEvento, this._descripcionEvento, this._informacionEvento);

  @override
  _AboutEventosState createState() => _AboutEventosState();
}

class _AboutEventosState extends State<AboutEventos> with SingleTickerProviderStateMixin {
  
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
        title: Text('Eventos'),
        backgroundColor: Colors.grey,
        bottom: new TabBar(
          controller: _controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.event)),
            new Tab(icon: new Icon(Icons.info_outline)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new descripcionEvento.DescripcionEvento(widget._imagenEvento, widget._tituloEvento, widget._descripcionEvento),
          new informacionEvento.InformacionEvento(widget._informacionEvento)
        ],
      ),
      
    );
  }
}
