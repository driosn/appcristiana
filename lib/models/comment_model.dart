import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Comment {

  String _id;
  String _userComment;
  String _finalComment;
  String _titleBlogComment;
  
 Comment(this._id, this._userComment, this._finalComment, this._titleBlogComment);

  Comment.map(dynamic obj) {
    this._userComment = obj['userComment'];
    this._finalComment = obj['finalComment'];
    this._titleBlogComment = obj['titleBlogComment'];
  }

  String get id => _id;
  String get userComment => _userComment;
  String get finalComment => _finalComment;
  String get titleBlogComment => _titleBlogComment;

  Comment.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _userComment = snapshot.value['userComment'];
    _finalComment = snapshot.value['finalComment'];
    _titleBlogComment = snapshot.value['titleBlogComment'];    
  }

}