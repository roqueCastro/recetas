import 'package:flutter/material.dart';


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