import 'package:flutter/material.dart';

import '../pagesTabs/descripcionIglesia_screen.dart';
import 'package:app_cristiana/screens/aboutIglesias_screen/pagesTabs/horariosIglesia_screen.dart';

class AboutIglesia extends StatefulWidget {
  @override
  _AboutIglesiaState createState() => _AboutIglesiaState();
}

class _AboutIglesiaState extends State<AboutIglesia> with SingleTickerProviderStateMixin {
  
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Iglesia'),
        bottom: new TabBar(
          controller: _controller,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.description)),
            new Tab(icon: Icon(Icons.alarm)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          DescripcionIglesia('Iglesia Peña de Horeb', 'assets/images/iglesias/iglesia1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean convallis, sapien non pharetra tristique, arcu odio sollicitudin felis, eu congue velit enim pretium turpis. Ut at turpis nec tellus euismod aliquet. Vestibulum massa ipsum, egestas ac porta vel, tempor quis mauris. Nullam facilisis metus nibh, ac faucibus velit ultrices id. Vivamus id massa sed nisi convallis venenatis sit amet vitae tellus. Aliquam facilisis congue dui eget semper. Etiam fermentum felis orci, a facilisis quam facilisis ut. Proin placerat magna a purus porttitor efficitur. Vivamus arcu eros, suscipit in mollis ut, venenatis et dui. Fusce eu iaculis leo. Duis semper tincidunt purus. Etiam nec quam sed diam aliquam egestas. Aenean convallis viverra est. Sed nisi tellus, ornare ut ullamcorper quis, consectetur eget metus. Fusce convallis, risus sit amet pellentesque aliquet, risus mi laoreet eros, a mattis magna eros quis enim.'),
          HorariosIglesia('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean convallis, sapien non pharetra tristique, arcu odio sollicitudin felis, eu congue velit enim pretium turpis. Ut at turpis nec tellus euismod aliquet. Vestibulum massa ipsum, egestas ac porta vel, tempor quis mauris. Nullam facilisis metus nibh, ac faucibus velit ultrices id. Vivamus id massa sed nisi convallis venenatis sit amet vitae tellus. Aliquam facilisis congue dui eget semper. Etiam fermentum felis orci, a facilisis quam facilisis ut. Proin placerat magna a purus porttitor efficitur. Vivamus arcu eros, suscipit in mollis ut, venenatis et dui. Fusce eu iaculis leo. Duis semper tincidunt purus. Etiam nec quam sed diam aliquam egestas. Aenean convallis viverra est. Sed nisi tellus, ornare ut ullamcorper quis, consectetur eget metus. Fusce convallis, risus sit amet pellentesque aliquet, risus mi laoreet eros, a mattis magna eros quis enim.')
        ],
      ),
    );
  }
}