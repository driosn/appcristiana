import 'package:app_cristiana/screens/eventos_screen/eventos_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:app_cristiana/screens/backstage_screen/backstage_screen.dart';


class SelectActivity extends StatelessWidget {
  
  final String _activityName;
  final String _backgroundImage;
  final double _sizeActivity;
  final Widget _nextWidget;

  SelectActivity(this._activityName, this._backgroundImage, this._sizeActivity, this._nextWidget);
  
  @override
  Widget build(BuildContext context) {

    final double _borderRadiusActivity = 12.0;

    return InkWell(
      child: Stack(
        children: <Widget>[
          Container(
          height: _sizeActivity,
          width: _sizeActivity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_backgroundImage),
              fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(_borderRadiusActivity)
          ),  
        ),
        Positioned(
          top: 15.0,
          left: 15.0,
          child: Text(
            _activityName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.w900
            ),
          ),
        )
        ],      ),
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _nextWidget)
        );
      }
    );
  }
}