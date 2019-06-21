import 'package:flutter/material.dart';

import 'package:app_cristiana/GeneralWidgets/about_screen.dart';

class BackStageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutScreen('BackStage', 'BackStage Description', 'assets/images/backstage.jpg', '''Qué pasa con los jóvenes bautistas de Bolivia cuando nadie está viendo? Pues nosotros les contamos''');
  }
}