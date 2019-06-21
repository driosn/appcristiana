import 'package:flutter/material.dart';

import 'package:app_cristiana/GeneralWidgets/about_screen.dart';

class UjblpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutScreen('UJBLP', 'Union Jovenes Bautistas La Paz', 'assets/images/jovenes.jpg', 
    '''Mision:
    
Proclamamos el Evangelio de Jesucristo, según las ordenanzas de la Biblia y establecemos iglesias en todo el territorio nacional y el exterior, enseñamos las verdades de la fe cristiana para el desarrollo integral del ser humano y servimos a sus necesidades sin discriminación de credo, grupo social o cultura.

Visión:

Somos la unión de iglesias evangélicas bautistas de Bolivia y tenemos un compromiso misionero integral que promueve la transformación de personas, de comunidades y de la sociedad multicultural con valores y principios Cristocéntricos.
    ''');
  }
}