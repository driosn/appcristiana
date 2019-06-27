import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyEvent {

  String _id;
  String _titleEvent;
  String _urlImage;
  String _description;
  String _information;
  String _date;
  
  MyEvent(this._id, this._titleEvent, this._urlImage, this._description, this._information,  this._date);

  MyEvent.map(dynamic obj) {
    this._titleEvent = obj['titleEvent'];
    this._urlImage = obj['urlImage'];
    this._description = obj['description'];
    this._information = obj['information'];
    this._date = obj['date'];
  }

  String get id => _id;
  String get titleEvent => _titleEvent;
  String get urlImage => _urlImage;
  String get description => _description;
  String get information => _information;
  String get date => _date;

  MyEvent.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _titleEvent = snapshot.value['titleEvent'];
    _urlImage = snapshot.value['urlImage'];
    _description = snapshot.value['description'];
    _information = snapshot.value['information']; 
    _date = snapshot.value['date'];
  }

}