import 'package:flutter/material.dart';

class TextFieldForAdd extends StatelessWidget {
  
  final TextEditingController _textEditingController;
  final IconData _iconData;
  final String _labelText;

  TextFieldForAdd(this._textEditingController, this._iconData, this._labelText); 
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      style: TextStyle(fontSize: 17, color: Colors.black),
      decoration: InputDecoration(icon: Icon(_iconData),
      labelText: _labelText),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }
}