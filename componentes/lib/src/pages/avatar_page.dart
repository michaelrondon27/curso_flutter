import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/marvelcinematicuniverse/images/8/87/Stan_Lee.png/revision/latest?cb=20190303192815&path-prefix=es'),
              radius: 25.0,
            ),
            padding: EdgeInsets.all(5.0),
          ),
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text('SL'),
            ),
            margin: EdgeInsets.only(right: 10.0),
          )
        ],
        title: Text('Avatar Page'),
      ),
      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage('https://dunesjedi.files.wordpress.com/2018/11/stan-lee-1200.jpeg'),
          placeholder: AssetImage('assets/jar-loading.gif'), 
        ),
      ),
    );
  }
}
