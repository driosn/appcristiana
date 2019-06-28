import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Blog {

  String _id;
  String _titleBlog;
  String _urlImage;
  String _urlVideo;
  String _contentBlog;
  
  Blog(this._id, this._titleBlog, this._urlImage, this._urlVideo, this._contentBlog);

  Blog.map(dynamic obj) {
    this._titleBlog = obj['titleBlog'];
    this._urlImage = obj['urlImage'];
    this._urlVideo = obj['urlVideo'];
    this._contentBlog = obj['content'];
  }

  String get id => _id;
  String get titleBlog => _titleBlog;
  String get urlImage => _urlImage;
  String get urlVideo => _urlVideo;
  String get contentBlog => _contentBlog;

  Blog.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _titleBlog = snapshot.value['titleBlog'];
    _urlImage = snapshot.value['urlImage'];
    _urlVideo = snapshot.value['urlVideo'];
    _contentBlog = snapshot.value['content'];
  }

}