import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyEvent {

  String _id;
  String _titleEvent;
  String _date;
  String _urlImage;
  String _description;
  String _information;
  
  MyEvent(this._id, this._titleEvent, this._date, this._urlImage, this._description, this._information);

  MyEvent.map(dynamic obj) {
    this._titleEvent = obj['titleEvent'];
    this._date = obj['date'];
    this._urlImage = obj['urlImage'];
    this._description = obj['description'];
    this._information = obj['information'];
  }

  String get id => _id;
  String get titleEvent => _titleEvent;
  String get date => _date;
  String get urlImage => _urlImage;
  String get description => _description;
  String get information => _information;

  MyEvent.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _titleEvent = snapshot.value['titleEvent'];
    _date = snapshot.value['date'];
    _urlImage = snapshot.value['urlImage'];
    _description = snapshot.value['description'];
    _information = snapshot.value['information']; 
  }

}