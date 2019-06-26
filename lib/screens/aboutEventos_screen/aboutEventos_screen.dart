import 'package:flutter/material.dart';

import './pagesTabs/descripcionEvento_screen.dart' as descripcionEvento;
import './pagesTabs/informacionEvento_screen.dart' as informacionEvento;

class AboutEventos extends StatefulWidget {

  @override
  _AboutEventosState createState() => _AboutEventosState();
}

class _AboutEventosState extends State<AboutEventos> with SingleTickerProviderStateMixin {
  
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
        title: Text('Eventos'),
        backgroundColor: Colors.grey,
        bottom: new TabBar(
          controller: _controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.event)),
            new Tab(icon: new Icon(Icons.info_outline)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new descripcionEvento.DescripcionEvento('assets/images/campamento.jpg','Este es el titulo de mi evento', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean convallis, sapien non pharetra tristique, arcu odio sollicitudin felis, eu congue velit enim pretium turpis. Ut at turpis nec tellus euismod aliquet. Vestibulum massa ipsum, egestas ac porta vel, tempor quis mauris. Nullam facilisis metus nibh, ac faucibus velit ultrices id. Vivamus id massa sed nisi convallis venenatis sit amet vitae tellus. Aliquam facilisis congue dui eget semper. Etiam fermentum felis orci, a facilisis quam facilisis ut. Proin placerat magna a purus porttitor efficitur. Vivamus arcu eros, suscipit in mollis ut, venenatis et dui. Fusce eu iaculis leo. Duis semper tincidunt purus. Etiam nec quam sed diam aliquam egestas. Aenean convallis viverra est. Sed nisi tellus, ornare ut ullamcorper quis, consectetur eget metus. Fusce convallis, risus sit amet pellentesque aliquet, risus mi laoreet eros, a mattis magna eros quis enim.'),
          new informacionEvento.InformacionEvento('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean convallis, sapien non pharetra tristique, arcu odio sollicitudin felis, eu congue velit enim pretium turpis. Ut at turpis nec tellus euismod aliquet. Vestibulum massa ipsum, egestas ac porta vel, tempor quis mauris. Nullam facilisis metus nibh, ac faucibus velit ultrices id. Vivamus id massa sed nisi convallis venenatis sit amet vitae tellus. Aliquam facilisis congue dui eget semper. Etiam fermentum felis orci, a facilisis quam facilisis ut. Proin placerat magna a purus porttitor efficitur. Vivamus arcu eros, suscipit in mollis ut, venenatis et dui. Fusce eu iaculis leo. Duis semper tincidunt purus. Etiam nec quam sed diam aliquam egestas. Aenean convallis viverra est. Sed nisi tellus, ornare ut ullamcorper quis, consectetur eget metus. Fusce convallis, risus sit amet pellentesque aliquet, risus mi laoreet eros, a mattis magna eros quis enim.')
        ],
      ),
      
    );
  }
}
