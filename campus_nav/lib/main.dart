import 'package:flutter/material.dart';

void main() => runApp(CampusNAV());

class CampusNAV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus NAV', 
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Campus NAV'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final conferencesList = [
    "Conference A",
    "Conference B",
    "Conference C", 
    "Conference D",
    "Conference E",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(conferences: conferencesList)
                );
              },
            )
          ],
        ),
        body: ConferenceList(),
        drawer: AppDrawer(),
    );
  }
}

class ConferenceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text('Conference A',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.blue)),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.yellow,
          ),
          title: Text('Conference A',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
          //onTap: function...,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
          ),
          title: Text('Conference A',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
          ),
          title: Text('Conference A',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
          ),
          title: Text('Conference A',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        )
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text(''),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),            
                
                ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Favorites'),
                  leading: Icon(Icons.star),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(thickness: 5,),

                ListTile(
                  title: Text('Help'),
                  leading: Icon(Icons.help),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(thickness: 5,),
              ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final conferences;
  DataSearch({this.conferences});

  final recentConferences = ['A', 'B'];

  @override
  List <Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear
        ),

        onPressed: () {
          query = "";
        })
      ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      
      onPressed: () {
        close(context, null);
      } 
    );
  }

  @override
  Widget buildResults(BuildContext context) {
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentConferences:conferences;
    return ListView.builder(
      itemBuilder: 
        (context, index) => ListTile(
          leading: Icon(Icons.help),
          title: Text(suggestionList[index]),
        ),
        itemCount: suggestionList.length,
    );
  }

}

