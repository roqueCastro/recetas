import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/animations/FadeAnimationOfBottomToTop.dart';
import 'package:recetas/src/views/Socks/ViewSocksPage.dart';

class HomePageSocks extends StatefulWidget{
  @override
  HomePageSocksState createState()=> HomePageSocksState();
  
}
class HomePageSocksState extends State<HomePageSocks>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            FadeAnimationOfBottomToTop(
              delay: 1,
              child: Container(
                height: 300,
                width: double.infinity,
                padding: EdgeInsets.only(left: 25, right: 25,top: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(255, 250, 182, 1),
                      Color.fromRGBO(255, 239, 78, 1),
                    ]
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    FadeAnimationOfBottomToTop(delay: 1,child: Image.asset("assets/png/menu.png", width: 35,)),
                    SizedBox(height: 15,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Expanded(
                          flex: 4,
                          child: FadeAnimationOfBottomToTop(
                            delay: 1.2,
                            child: Text(
                              "Best Only \nSocks Collections",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(97, 90, 90, 1)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: FadeAnimationOfBottomToTop(delay: 1.3,child: Image.asset("assets/png/calcetin.png")),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -35),
              child: FadeAnimationOfBottomToTop(
                delay: 1.2,
                child: Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.only(left: 20, top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[350], blurRadius: 20.0, offset: Offset(0,10.0)),
                    ]
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, color: Colors.black, size: 20,),
                      border: InputBorder.none,
                      hintText: "Search"
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      FadeAnimationOfBottomToTop(
                        delay: 1.2,
                        child: Text(
                          "Choose \na Category",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(97, 90, 90, 1),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[

                            FadeAnimationOfBottomToTop(
                              delay: 1.2,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.all(10),
                                onPressed: (){},
                                color: Color.fromRGBO(251, 53, 105, .1),
                                child: Text("Adult",style: TextStyle(color: Color.fromRGBO(251, 53, 105, 1),fontSize: 16, fontWeight: FontWeight.bold),),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            FadeAnimationOfBottomToTop(
                              delay: 1.3,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.all(10),
                                onPressed: (){},
                                color: Color.fromRGBO(97, 90, 90, .1),
                                child: Text("Children",style: TextStyle(color: Color.fromRGBO(97, 90, 90, .6),fontSize: 16, fontWeight: FontWeight.bold),),
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
            // SizedBox(height: 30.0,),
            Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20,left: 20),
                scrollDirection: Axis.horizontal,
                children: <Widget>[

                  FadeAnimationOfBottomToTop(
                    delay: 1.3,
                    child: makeCard(
                      context: context,
                      startcolor: Color.fromRGBO(251,121,155,1),
                      endColor: Color.fromRGBO(251, 53, 105, 1),
                      image: "assets/png/socks-one.png"
                    ),
                  ),
                  FadeAnimationOfBottomToTop(
                    delay: 1.4,
                    child: makeCard(
                      context: context,
                      startcolor: Color.fromRGBO(203, 251, 255, 1),
                      endColor: Color.fromRGBO(81, 223, 234, 1),
                      image: "assets/png/socks-dos.png"
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget makeCard({context,startcolor,endColor,image}){
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(PageTransition(child: ViewSocksPage(), type: PageTransitionType.fade)).then((value) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed("/socks");
      }),
      child: AspectRatio(
        aspectRatio: 4/5,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                startcolor,
                endColor
              ]
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350],
                blurRadius: 10,
                offset: Offset(5, 10)
              )
            ]
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
  
}