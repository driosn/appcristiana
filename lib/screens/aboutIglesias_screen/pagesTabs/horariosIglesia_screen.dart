import 'package:flutter/material.dart';

class HorariosIglesia extends StatelessWidget {
  
  final String _horarioIglesia;

  HorariosIglesia(this._horarioIglesia);

  @override
  Widget build(BuildContext context) {

    final String horarioText = 'Horarios: ';

    final _headerInformacion = Text(
     horarioText,
     style: TextStyle(
       fontSize: 32.0,
       fontWeight: FontWeight.bold
     ),
    );

    final _masInformacion = Text(
      _horarioIglesia,
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