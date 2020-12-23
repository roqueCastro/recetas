import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recetas/src/animations/FadeAnimation.dart';
import 'package:recetas/src/views/Search/HomePageSearched.dart';

class Searched extends StatefulWidget{
  @override
  SearchedState createState()=> SearchedState();
  
}
class SearchedState extends State<Searched> with TickerProviderStateMixin{
  //var transition
  AnimationController _animationController;
  Animation<double> _animation;

  bool _textVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/start.jpg"),
                  fit: BoxFit.cover
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2),
                  ]
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    FadeAnimation(
                      delay: .5,
                      child: Text(
                        "Talking order for faster delivery",
                        style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(
                      delay: 1,
                      child: Text(
                        "See restaurants nearby by \nadding location",
                        style: TextStyle(color: Colors.white, height: 1.4, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 100,),
                    FadeAnimation(
                      delay: 1.2,
                      child: ScaleTransition(
                        scale: _animation,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow,
                                Colors.orange
                              ]
                            )
                          ),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: ()=>_onTap(),
                              minWidth: double.infinity,
                              child: Text("Start", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    FadeAnimation(
                      delay: 1.4,
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 50),
                        child: Align(
                          child: Text("Now delivery to your door 24/7",
                            style: TextStyle(color: Colors.white70, fontSize: 15,),),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: AppBar(
              title: Text("Searched"),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
              ],
            ),
            height: kToolbarHeight + 25,
          )

        ]
      ),
      drawer: Drawer(),
    );
  }

  //INIT
  @override
  void initState() {
    // TODO: implement initState

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();

    super.dispose();
  }


  //ONTAP
  void _onTap(){
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((value) =>
    Navigator.of(context).push(PageTransition(child: HomePageSearched(), type: PageTransitionType.fade)).then((value){
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed("/food");
    })
    );
  }


}

//
class DataSearch extends SearchDelegate<String>{

  //
  List<String> paises = [
    'Albania',
    'Alemania',
    'Andorra',
    'Argentina',
    'Austria',
    'Azerbaiyán',
    'Bielorrusia',
    'Bélgica',
    'Bolivia',
    'Bosnia-Herzegovina',
    'Brasil',
    'Bulgaria',
    'Camerún',
    'Canadá',
    'Chile',
    'Chipre',
    'Colombia',
    'Costa Rica',
    'Croacia',
    'Cuba2'
  ];

  final recent_paises = [
    'Brasil',
    'Bulgaria',
    'Camerún',
    'Canadá',
    'Chile',
    'Chipre'
  ];
  //
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
        splashColor: Colors.black,
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left  of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      splashColor: Colors.black,
      onPressed: ()=>close(context,null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for somethings
    final suggestionList = query.isEmpty ? recent_paises : paises.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
    // var suggestionList = query.isEmpty ? recent_paises : paises.where((element) => element.toLowerCase().contains(query)).toList();


    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, i)
      {
        int idx = suggestionList[i].toLowerCase().indexOf(query.toLowerCase());

        bool isSpace = query.trim().isEmpty;
        if(isSpace && query != ""){
          return null;
        }

        return
          ListTile(
            leading: Icon(Icons.location_city),
            title: RichText(
              text: TextSpan(
                text: query != ""? idx != 0? suggestionList[i].substring(0, idx)  :  "" : suggestionList[i].substring(0),
                style: TextStyle(
                    color: Colors.grey, backgroundColor: Colors.transparent),
                children: [
                  TextSpan(
                    text: suggestionList[i].substring(idx != 0 ? idx : 0, idx != 0 ? idx+query.length : query.length),
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.amberAccent),
                  ),
                  TextSpan(
                    text: query != "" ? suggestionList[i].substring(idx+query.length)   : "",
                    style: TextStyle(
                        color: Colors.grey, backgroundColor: Colors.transparent),
                  ),
                ],
              ),

            ),
          );
      }
    );
  }

}