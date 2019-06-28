import 'package:flutter/material.dart';

class DescripcionIglesia extends StatelessWidget {
  
  final String _titleIglesia;
  final String _imageIglesia;
  final String _descripcionIglesia;

  DescripcionIglesia(this._titleIglesia, this._imageIglesia, this._descripcionIglesia);
  
  @override
  Widget build(BuildContext context) {
    

    final titleIglesia = Text(
      _titleIglesia,
      style: TextStyle(
        color: Colors.black,
        fontSize: 32.0,
        fontWeight: FontWeight.bold
      ),
    );

    final imageIglesia = Container(
      child: Image.network(
        _imageIglesia
      )
    );

    final descriptionIglesia = Text(
      _descripcionIglesia,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 16.0
      ),
    );
    
    
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: ListView(
        children: <Widget>[
          titleIglesia,
          SizedBox(height: 30.0),
          imageIglesia,      
          SizedBox(height: 30.0),
          descriptionIglesia
        ],
      ),
    ); 
  }
}