import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Iglesia {

  String _id;
  String _titleIglesia;
  String _urlImage;
  String _description;
  String _horarios;
  String _zona;
  
  Iglesia(this._id, this._titleIglesia, this._urlImage, this._description, this._horarios,  this._zona);

  Iglesia.map(dynamic obj) {
    this._titleIglesia = obj['titleIglesia'];
    this._urlImage = obj['urlImage'];
    this._description = obj['description'];
    this._horarios = obj['horarios'];
    this._zona = obj['zona'];
  }

  String get id => _id;
  String get titleIglesia => _titleIglesia;
  String get urlImage => _urlImage;
  String get description => _description;
  String get horarios => _horarios;
  String get zona => _zona;

  Iglesia.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _titleIglesia = snapshot.value['titleIglesia'];
    _urlImage = snapshot.value['urlImage'];
    _description = snapshot.value['description'];
    _horarios = snapshot.value['horarios']; 
    _zona = snapshot.value['zona'];
  }

}