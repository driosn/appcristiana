import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
    
  final String _itemImage;
  final String _itemTitle;
  final String _itemInfo;
  final Widget _navigationWidget;
    
  CardItem(this._itemImage, this._itemTitle, this._itemInfo, this._navigationWidget);

  @override
  Widget build(BuildContext context) {

    final _borderRadiusItem = 12.0;

    final cardContainer = Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadiusItem),
        color: Colors.white
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            Flexible(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                    _itemTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    _itemInfo,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300
                    ),
                  )
                 ],
               ),
            ),
            SizedBox(width: 5.0),
            Container(
              height: 140.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_itemImage),
                  fit: BoxFit.fill
                )
              ),
            ),
            SizedBox(width: 5.0)
          ],
        ),
      )
    );



    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _navigationWidget)
        );
      },
        child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Flexible(child: cardContainer),
          SizedBox(width: 10.0)
        ],
      ),
    );
  }
}