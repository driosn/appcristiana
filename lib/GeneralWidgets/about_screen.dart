import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override

  final String aboutName;
  final String aboutDescription;
  final String aboutPhoto;
  final String aboutText;
  
  final String location = 'Bolivia';
  final String url = 'www.ubb.org.bo';


  String linkedinLogo = "https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png";

  AboutScreen(this.aboutName, this.aboutDescription, this.aboutPhoto, this.aboutText);
  
  Widget build(BuildContext context) {
    
    Widget aboutPhoto_Container () {
      return Container(
              width: 130.0,
              height: 130.0,
              margin: EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage(aboutPhoto),
              ),
            );
    }

    Widget aboutName_Text () {
      return Text(aboutName,
              style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold
              ),
            );
    }

    Widget aboutDescription_Text (){
      return Text(
          aboutDescription,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
          ),
      );
    } 

    Widget aboutAppBar () {
        return Container(
        color: Colors.grey,
        height: 310.0,
        width: double.infinity,
        padding: EdgeInsets.only(top: 55.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: aboutPhoto_Container(),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: aboutName_Text(),
                ),
              ),
              Expanded(
                  child: aboutDescription_Text(),
              )
            ],
          ),
      );
    } 

    Widget location_Text (){
        return Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Colors.black54,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(location, 
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0
            ),
            )
          )
        ],
      );
    } 

    Widget linkedin_Inkwell (){
      return InkWell(
        onTap: (){
          
        },
        child: Row(
        children: <Widget>[
          Icon(
            Icons.link,
            color: Colors.black54,
          ),
         Expanded(
           child: Container(
               margin: EdgeInsets.only(left: 10.0),
               child: Text(
               url,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                   color: Colors.black54,
                   fontSize: 16.0
               ),
             )
           ),
         )
        ],
       )
     );
    } 

    Widget informationContainer (){
      return Transform.translate(
        offset: Offset(0,-32.0),
        child: Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: new Border .all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 7.0)
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Información",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: location_Text(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: linkedin_Inkwell(),
                  ),
                ],
              ),
            )
        ),
      );
    } 

    Widget about_Text (){
       return Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Icon(
           Icons.info_outline,
           color: Colors.black54,
           ),
         Flexible(
           child: Padding(
             padding: EdgeInsets.only(left: 20.0),
             child: Text(
             aboutText,
             style: TextStyle(
               color: Colors.black54,
               fontSize: 16.0,
               fontWeight: FontWeight.normal
               ),
             ),
           )
         )  
       ],
      );
    } 

    Widget aboutContainer (){
      return Transform.translate(
        offset: Offset(0, -16.0),
        child: Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 7.0)
                )
              ],
              border: new Border .all(
                  color: Theme.of(context).dividerColor,
                  width: 1.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("About",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: about_Text(),
                  )
                ],
              ),
            )
        ),
      );
    } 

    final arrowAppbar = InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.white, 
      )
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                aboutAppBar(),
                informationContainer(),
                aboutContainer(),
              ],
            ),
            Positioned(
              top: 40.0,
              left: 4.0,
              child: InkWell(
                onTap: (){Navigator.pop(context);},
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
  }
}