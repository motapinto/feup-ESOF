//Flutter widgets
import 'package:flutter/material.dart';
//Acess to custom list tile widget
import 'conferenceTile.dart';
//App drawer used in all modules
import 'drawer.dart';
//Reads fav's before displaying in favourite module
import 'storage.dart';

class MyFavourites extends StatelessWidget {

  final conferencesList = conferenceVector();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Favourites")),
        body: FavouritesList(list: conferencesList),
        drawer: AppDrawer(),
    );
  }

}

class FavouritesList extends StatefulWidget {
  final list;
  FavouritesList({@required this.list});
  
  @override
  State <StatefulWidget> createState() => FavouritesListState(list: list);
}

class FavouritesListState extends State<FavouritesList> {
  final list;
  FavouritesListState({@required this.list});

  final customWidgetList = <Widget>[];
  bool isFavourited;

  void checkFutureFavourites(String index) {
    readFavourites(index).then((futureValue) {
      setState(() {
        if(futureValue == "1") {
          isFavourited = true; 
        }
        else {
          isFavourited = false; 
          list.removeAt(int.parse(index));
        } 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i<list.length; i++) {
      checkFutureFavourites("$i");
      if(isFavourited!= null)
        debugPrint("bool: $isFavourited ; index: $i");
        customWidgetList.add(
          MyCustomWidget(
            index: i,
            name: list[i][0],
            theme: list[i][1],
            starts: list[i][2],
            ends: list[i][3],
            room: list[i][4],
            image: list[i][5],
            speakers: list[i][6]
          )
        );
    }

    return ListView( children: customWidgetList, );
  }
}