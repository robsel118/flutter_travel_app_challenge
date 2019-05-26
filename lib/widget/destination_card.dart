import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({
      this.imageUrl,
      this.city,
      this.country,
      this.activities,
      this.description});

  final String imageUrl;
  final String city;
  final String country;
  final int activities;
  final String description;

  @override
  Widget build(BuildContext context) {
    final double _cardSize = MediaQuery.of(context).size.width * 0.5;

    return Container(
        height: _cardSize * 1.5,
        width: _cardSize + 6.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _cardSize - 60,
              left: 0.0,
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    width: _cardSize,
                    height: _cardSize * 0.6,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: AutoSizeText(
                            "$activities activities",
                            minFontSize: 18,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                                height: 3.0),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            "$description",
                            maxLines: 2,
                            style: TextStyle(color: Colors.grey),
                          )
                        )
                      ],
                    ),
                  )),
            ),
            Positioned(
                top: 0.0,
                left: 13.0,
                child: Hero(
                  tag: city,
                  child: Container(
                      width: _cardSize - 20.0,
                      height: _cardSize - 20.0,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                      child: null),
                )),
            Positioned(
              top: _cardSize* 0.5,
              left: 25.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(city,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500)),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white70,
                      ),
                      Text(country, style: TextStyle(color: Colors.white70))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
