import 'package:flutter/material.dart';
import 'package:travelapp/widget/destination_card.dart';
import 'package:travelapp/utils/widget-utils.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _subPage = 0;
  int _selectedIndex = 0;
  void changePage(int newPageId) {
    setState(() {
      _subPage = newPageId;
    });
  }

  void _onMenuTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: null,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green[800],
          onTap: _onMenuTapped,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(
                "",
                style: TextStyle(height: 0.0),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_out),
              title: Text(
                "",
                style: TextStyle(height: 0.0),
              ),
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    "https://media.licdn.com/dms/image/C4D03AQFaUl8QCdoqUg/profile-displayphoto-shrink_200_200/0?e=1564012800&v=beta&t=aqztpHUJrQhcG01AeViC3KlX_Y0r5qTT40pJwP78ako"),
              ),
              title: Text(
                "",
                style: TextStyle(height: 0.0),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100.0, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: _screenSize.width * 0.7,
                  child: Text("What you would like to find?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                      textAlign: TextAlign.start),
                ),
                Container(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Transform.rotate(
                        angle: 1.57,
                        child: _menuButton(
                            0,
                            Icons.airplanemode_active,
                            Colors.green[50],
                            Colors.green,
                            () => this.changePage(0))),
                    _menuButton(1, Icons.drive_eta, Colors.orange[50],
                        Colors.orange, () => this.changePage(1)),
                    _menuButton(2, Icons.rowing, Colors.blue[50], Colors.blue,
                        () => this.changePage(2)),
                    _menuButton(3, Icons.motorcycle, Colors.purple[50],
                        Colors.purple, () => this.changePage(3)),
                  ],
                ),
                Container(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Top Destinations",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0,
                        )),
                    FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text("See All",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 20.0)),
                        onPressed: () {})
                  ],
                ),
                Container(
                  height: _screenSize.width * 0.7,
                  width: _screenSize.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItems(index);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Explusive Hotels",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0,
                        )),
                    FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text("See All",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 20.0)),
                        onPressed: () {})
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    width: _screenSize.width,
                    height: 300.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://static.vueling.com/cms/media/1216982/roma_istock_000004009055medium.jpg"),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _buildItems(int index) {
    print("$index");
    if (index == 0) {
      return WidgetUtils.addClick(
          Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: DestinationCard(
                imageUrl:
                    "https://live.staticflickr.com/6103/6218107960_022a287f49_b.jpg",
                city: "Venice",
                country: "Italy",
                activities: 125,
                description:
                    "Enjoy best trips from top travel agencies at best prices",
              )),
          () => Navigator.pushNamed(context, '/destination'));
    } else {
      return Container(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: DestinationCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/0/03/Visuel-carrousel-dossier-Ou-sortir-le-soir-a-Paris-%D9%86%D9%85%D8%A7740x380-C-DR.jpg",
            city: "Paris",
            country: "France",
            activities: 98,
            description:
                "Unique and customized tours organized by local agencies",
          ));
    }
  }

  Widget _menuButton(int pageId, IconData icon, Color backgroundColor,
      Color iconColor, Function onPress) {
    return FloatingActionButton(
      heroTag: pageId,
      backgroundColor:
          (_subPage == pageId) ? backgroundColor : Colors.grey[300],
      elevation: 0.0,
      child: Icon(icon, color: (_subPage == pageId) ? iconColor : Colors.grey),
      onPressed: onPress,
    );
  }
}
