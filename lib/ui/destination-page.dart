import 'package:flutter/material.dart';
import 'dart:core';
import 'package:travelapp/widget/activity.dart';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  ScrollController _scrollController;
  bool _isExpanded = false;
  static const kSilverSize = 300 - kToolbarHeight;
  double _currentSize = 300 - kToolbarHeight;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() => setState(() {
            _isExpanded = (_scrollController.hasClients &&
                _scrollController.offset > kSilverSize);

            if (_scrollController.hasClients &&
                _scrollController.offset <= kSilverSize &&
                _scrollController.offset >= 0) {
              _currentSize = kSilverSize - _scrollController.offset;
            }
          }));
  }

  double getScale(double maxSize) {
    return maxSize * _currentSize / kSilverSize;
  }

  Color getColorScaled() {
    num v = 255 - (255 * _currentSize / kSilverSize).round().abs();

    return Color.fromRGBO(v, v, v, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
              iconTheme: IconThemeData(
                color: getColorScaled(), //change your color here
              ),
              expandedHeight: 300,
              pinned: true,
              backgroundColor: (_isExpanded) ? Colors.blue : Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Venice",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500)),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on,
                              color: Colors.white70, size: getScale(15.0)),
                          Text("Italy",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: getScale(15.0)))
                        ],
                      )
                    ],
                  )),
                  background: Hero(
                      tag: "Venice",
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0)),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://live.staticflickr.com/6103/6218107960_022a287f49_b.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ))),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  tooltip: 'Search',
                  onPressed: () {/* ... */},
                ),
                IconButton(
                  icon: const Icon(Icons.sort),
                  tooltip: 'Sort',
                  onPressed: () {/* ... */},
                ),
              ]),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ActivityWidget(
                      type: "Sighseeing Tour",
                      rating: 5,
                      name: "St. Mark Basilica",
                      price: 30,
                      times: ["9:00 am", "11:00 am"],
                      imageUrl:
                          "https://i1.wp.com/www.walksofitaly.com/blog/wp-content/uploads/2012/11/San-Marco-Cathedral-copy.jpg",
                    ),
                    ActivityWidget(
                      type: "Sighseeing Tour",
                      rating: 5,
                      name: "Walking Tour Gondola Ride",
                      price: 210,
                      times: ["7:00 am", "8:00 am"],
                      imageUrl:
                          "https://cache-graphicslib.viator.com/graphicslib/mm/40/venice-gondola-ride-and-serenade-281240-raw.jpg",
                    ),
                    ActivityWidget(
                      type: "Sighseeing Tour",
                      rating: 5,
                      name: "Murano and Burano Tour",
                      price: 125,
                      times: ["9:00 am", "11:00 am"],
                      imageUrl:
                          "https://cache-graphicslib.viator.com/graphicslib/mm/97/murano-burano-and-torcello-half-day-sightseeing-tour-155497-raw.jpg",
                    ),
                    ActivityWidget(
                      type: "Sighseeing Tour",
                      rating: 5,
                      name: "Walking Tour Gondola Ride",
                      price: 210,
                      times: ["7:00 am", "8:00 am"],
                      imageUrl:
                          "https://cache-graphicslib.viator.com/graphicslib/mm/40/venice-gondola-ride-and-serenade-281240-raw.jpg",
                    ),
                    ActivityWidget(
                      type: "Sighseeing Tour",
                      rating: 5,
                      name: "Murano and Burano Tour",
                      price: 125,
                      times: ["9:00 am", "11:00 am"],
                      imageUrl:
                          "https://cache-graphicslib.viator.com/graphicslib/mm/97/murano-burano-and-torcello-half-day-sightseeing-tour-155497-raw.jpg",
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
