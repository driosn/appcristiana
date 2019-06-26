import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:app_cristiana/screens/eventos_screen/widgets/card_item.dart';
import 'package:app_cristiana/screens/aboutBlogs_screen/aboutBlog_screen.dart';
import 'package:app_cristiana/screens/addScreens/add_blog.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String exampleDescription = '''Hebreos 11: 39-40 
    
En Hebreos 11 se escribe acerca de los héroes de la fe. Es muy interesante leer sobre su fidelidad y la fe que tenían, pero está escrito: “Y todos éstos, aunque alcanzaron buen testimonio mediante la fe, no recibieron lo prometido.” Hebreos 11:39. Así que, ¿cuál fue la promesa que estos héroes de la fe no recibieron? Hombres y mujeres que se mantuvieron firmes en su fe y en su ardiente amor por Dios hasta la muerte. ¿Cuál fue la promesa de Dios que no recibieron, pero que nosotros podemos alcanzar? Esto está escrito en el último verso: “Proveyendo Dios alguna cosa mejor para nosotros, para que no fuesen ellos perfeccionados aparte de nosotros.” Hebreos 11:40.  

Un tiempo completamente nuevo, con nuevas posibilidades, llegó sobre la tierra cuando Jesús vino al mundo. Él vino con el evangelio por medio del cual podemos ser transformados y conformarnos a la imagen del Hijo. (2 Corintios 3:18; Romanos 8:29) Podemos participar de los frutos del Espíritu, que son las virtudes de Jesucristo; es esto lo que antes de Cristo era imposible.

¡Las posibilidades en Cristo!
Las personas antes de que Cristo viniera podían obtener bendiciones terrenales a través del temor divino. Y, por supuesto, podían recibir vida eterna y el perdón de los pecados. Pero era completamente diferente a lo que podemos alcanzar ahora. Anteriormente necesitaban acercarse a Dios y llevar sacrificios de animales para obtener el perdón por sus pecados; tenían que sacrificar una y otra vez, ya que no podían ser liberado de su naturaleza. Eso era imposible para la ley. Pero cuando Jesús vino, entonces lo que era imposible para la ley se hizo posible.  (Romanos 8: 1-4) Ese es un mensaje increíble. 

Ahora puedo venir a Jesús y beber del agua viva que estaba en Su Espíritu. ¡Y yo mismo puedo recibir este Espíritu dentro de mí! El Espíritu puede conducir hacia la vida eterna tanto a las personas que me escuchan como a las que me ven, para que de esta manera el pecado pueda terminar. Los judíos tuvieron grandes promesas en el tiempo que vivieron. ¡Pero nosotros hemos recibido promesas aún más grandes en el tiempo en que vivimos! Muchas personas no lo ven en estos días, pero Pedro escribió sobre esto hace ya 2000 años “por medio de las cuales nos ha dado preciosas y grandísimas promesas, para que por ellas llegaseis a ser participantes de la naturaleza divina, habiendo huido de la corrupción que hay en el mundo a causa de la concupiscencia” ¡Esta es una increíble promesa, y también tomará parte en nosotros! 

Dios ha preparado una ciudad en la eternidad para esos héroes de la fe, para que junto con nosotros alcancen lo que no pudieron alcanzar en el antiguo pacto. Estaremos juntos con ellos en la eternidad y cumpliremos con lo que no pudieron recibir en ese momento.  ¡Así que hay una tremenda gloria esperándonos en Jesucristo! Y cuando El regrese y comience una nueva era, la gloriosa plenitud del Espíritu llenará toda la tierra y será una bendición tanto para las personas como para los animales. ¡Los animales ya no se devorarán entre sí e incluso un niño podrá acercarse a un león! Un Espíritu completamente nuevo de los tiempos vendrá sobre la tierra. ''';

    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBlog())
          );
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      drawer: HomePage.createDrawer(context),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: ListView(
          children: <Widget>[
            CardItem("assets/images/exampleblog/blog1.jpg", "La excepcional promesa que Dios preparó para nosotros", "Union Bautista Boliviana", AboutBlogScreen("La excepcional promesa que Dios preparó para nosotros", "assets/images/exampleblog/blog1.jpg", exampleDescription)),
            CardItem("assets/images/exampleblog/blog2.jpg", "!Una convincente motivación para seguir la justicia!", "Union Bautista Boliviana",AboutBlogScreen("La excepcional promesa que Dios preparó para nosotros", "assets/images/exampleblog/blog1.jpg", exampleDescription)),
            CardItem("assets/images/exampleblog/blog3.jpg", "La verdad acerca de la justicia atribuida", "Union Bautista Boliviana", AboutBlogScreen("La excepcional promesa que Dios preparó para nosotros", "assets/images/exampleblog/blog1.jpg", exampleDescription)),
            CardItem("assets/images/exampleblog/blog4.jpg", "Zaqueo: Una invitación especial y un cambio drástico", "Union Bautista Boliviana", AboutBlogScreen("La excepcional promesa que Dios preparó para nosotros", "assets/images/exampleblog/blog1.jpg", exampleDescription)),
            CardItem("assets/images/exampleblog/blog5.jpg", "¿Cuál es el significado de tener a Jesús como Sumo Sacerdote?", "Union Bautista Boliviana", AboutBlogScreen("La excepcional promesa que Dios preparó para nosotros", "assets/images/exampleblog/blog1.jpg", exampleDescription)),
          ],
        ),
      ),
    );
  }
}