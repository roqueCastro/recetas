import 'package:flutter/material.dart';
import 'package:recetas/src/animations/FadeAnimationOfTopToBottom.dart';


class ViewSocksPage extends StatefulWidget{
  @override
  ViewSocksPageState createState()=> ViewSocksPageState();
  
}
class ViewSocksPageState extends State<ViewSocksPage>{

  //


  @override
  Widget build(BuildContext context) {

    //
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height/3,
            child: FadeAnimationOfTopToBottom(
              delay: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                        Color.fromRGBO(251, 121, 155, 1),
                        Color.fromRGBO(251, 53, 105, 1)
                    ]
                  )
                ),
                child: Transform.translate(
                  offset: Offset(30, -10),
                  child: FadeAnimationOfTopToBottom(delay: 1.2 ,child: Image.asset("assets/png/socks-one.png"))
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: FadeAnimationOfTopToBottom(
              delay: 1.2,
              child: IconButton(
                onPressed: ()=>Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: mediaQuery.size.height/1.4 ,
            child: FadeAnimationOfTopToBottom(
              delay: 1,
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0) ,topRight: Radius.circular(25.0)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      FadeAnimationOfTopToBottom(
                        delay: 1.1,
                        child: Text(
                          "Ranger export",
                          style: TextStyle(
                            color: Color.fromRGBO(97, 90, 90, .54),
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      FadeAnimationOfTopToBottom(
                        delay: 1.2,
                        child: Text(
                          "Ankle Men\'s Athletic Socks",
                          style: TextStyle(
                              color: Color.fromRGBO(97, 90, 90, 1),
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 23,),
                      FadeAnimationOfTopToBottom(
                        delay: 1.3,
                        child: Text(
                          "Ranger export socks are fusion of materials of the  sturdiest quality and versatile design that suits all purposes. Each pair of Ranger socks is knitted from 100% combed cotton yam running along a reinforced 2-Ply core polyester based elastic through out the socks.",
                          style: TextStyle(
                              color: Color.fromRGBO(97, 90, 90, .54),
                              fontSize: 18,
                              height: 1.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[

                          FadeAnimationOfTopToBottom(
                            delay: 1.2,
                            child: Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(width: 3 , color: Colors.red),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          FadeAnimationOfTopToBottom(
                            delay: 1.3,
                            child: Container(
                              width: 25,
                              height: 25,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(251, 53, 105, 1),
                              ),
                            ),
                          ),
                          FadeAnimationOfTopToBottom(
                            delay: 1.4,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(81, 234, 234, 1),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 50,),
                      FadeAnimationOfTopToBottom(
                        delay: 1.2,
                        child: Text("More options", style: TextStyle(
                            color: Color.fromRGBO(97, 90, 90, .54),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 80.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[

                            FadeAnimationOfTopToBottom(
                              delay: 1.3,
                              child: AspectRatio(
                                aspectRatio: 3.2/1 ,
                                child: Container(
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: <Widget>[

                                      Container(
                                        width: 56,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color.fromRGBO(251, 53, 105, 1)
                                        ),
                                        child: Image.asset("assets/png/calcetin.png"),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[

                                          Text(
                                            "Ankle Lenght Socks",
                                            style: TextStyle(
                                              color: Color.fromRGBO(97, 90, 90, 1),
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(height: 2,),
                                          Text(
                                            "23,235",
                                            style: TextStyle(
                                                color: Color.fromRGBO(97, 90, 90, .54),

                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimationOfTopToBottom(
                              delay: 1.4,
                              child: AspectRatio(
                                aspectRatio: 3.2/1 ,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20 ),
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: <Widget>[

                                      Container(
                                        width: 56,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color:  Color.fromRGBO(81, 234, 234, 1)
                                        ),
                                        child: Image.asset("assets/png/calcetin.png"),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[

                                          Text(
                                            "Quarter Length Socks",
                                            style: TextStyle(
                                              color: Color.fromRGBO(97, 90, 90, 1),
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(height: 2,),
                                          Text(
                                            "23,235",
                                            style: TextStyle(
                                                color: Color.fromRGBO(97, 90, 90, .54),

                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      FadeAnimationOfTopToBottom(
                        delay: 1.4,
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(251, 121, 155, 1),
                                Color.fromRGBO(251, 53, 105, 1)
                              ]
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10
                              )
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[

                                  Text(
                                    "\$14.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    "46",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              ),
                              Text(
                                "Pay",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),



                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      )
    );
  }
  
}