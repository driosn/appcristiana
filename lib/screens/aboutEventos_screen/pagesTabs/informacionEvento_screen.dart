import 'package:flutter/material.dart';

class InformacionEvento extends StatelessWidget {
  
  final String _titleInformacion = 'Información acerca del evento';
  final String _informacionEvento;

  InformacionEvento(this._informacionEvento);

  @override
  Widget build(BuildContext context) {

    final _headerInformacion = Text(
    _titleInformacion,
    style: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold
    ),
  );

    final _masInformacion = Text(
      _informacionEvento,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 16.0
      ),
    );

    return Container(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            _headerInformacion,
            SizedBox(height: 30.0),
            _masInformacion
          ],    
        ),
      )
    );
  }
}

