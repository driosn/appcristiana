import 'package:app_cristiana/models/event_model.dart';
import 'package:app_cristiana/screens/aboutBlogs_screen/aboutBlog_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/iglesias_screen/iglesias_screen.dart';
import 'package:app_cristiana/screens/ubb_screen/ubb_screen.dart';

import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:app_cristiana/GeneralWidgets/about_screen.dart';
import 'package:app_cristiana/screens/backstage_screen/backstage_screen.dart';
import 'package:app_cristiana/screens/eventos_screen/eventos_screen.dart';
import 'package:app_cristiana/screens/blog_screen/blog_screen.dart';

import 'screens/addScreens/add_evento.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

// AboutBlogScreen("La excepcional promesa que Dios preparó para nosotros", "assets/images/exampleblog/blog1.jpg", '''Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum. orem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.'''),