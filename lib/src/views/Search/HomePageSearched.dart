import 'package:flutter/material.dart';
import 'package:recetas/src/animations/FadeAnimation.dart';

class HomePageSearched extends StatefulWidget{
  @override
  HomePageSearchedState createState()=> HomePageSearchedState();
}
class HomePageSearchedState extends State<HomePageSearched>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.grey[100],
        actions: <Widget>[

          IconButton(
            onPressed: (){},
            icon: Icon(Icons.shopping_basket,color: Colors.grey[800],),
          ),

        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[

                  FadeAnimation(
                    delay: 1,
                    child: Text("Food Delivery ", style: TextStyle(color: Colors.grey[80],fontWeight: FontWeight.bold,fontSize: 30),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                        FadeAnimation(delay: 1,child: makeCategory(isActive:true, title:"Pizza"),),
                        FadeAnimation(delay: 1.2,child: makeCategory(isActive:false, title:"Salsa"),),
                        FadeAnimation(delay: 1.4,child: makeCategory(isActive:false, title:"Empanadas"),),
                        FadeAnimation(delay: 1.6,child: makeCategory(isActive:false, title:"Pan"),),
                        FadeAnimation(delay: 1.8,child: makeCategory(isActive:false, title:"Desert"),),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
            FadeAnimation(
              delay: 1,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Free delivery",style: TextStyle(color: Colors.grey[700],fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                    FadeAnimation(delay: 1.2, child: makeItem(image: "assets/images/uno.jpg"),),
                    FadeAnimation(delay: 1.4, child: makeItem(image: "assets/images/dos.jpg"),),
                    FadeAnimation(delay: 1.6, child: makeItem(image: "assets/images/tres.jpg"),),

                  ],
                ),
              ),
            ),
            SizedBox(height: 30,)

          ],
        ),
      ),
    );

  }

  Widget makeCategory({isActive,title}){
    return AspectRatio(
      aspectRatio: isActive ? 3: 2.5/1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700]: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white: Colors.grey[500],
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.2,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [
                  .2,.9
                ],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ]
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite,color: Colors.white,),
                  ),
                  Column(
                    children: <Widget>[

                      Text("\$ 15.00",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),
                      SizedBox(height: 10,),
                      Text("Vegetarian Pizza",style: TextStyle(color: Colors.white, fontSize: 20),),


                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}

