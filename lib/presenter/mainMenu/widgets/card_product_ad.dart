import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardProductAd extends StatefulWidget {
  CardProductAd({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productLocation,
    required this.imageLink,
    this.isFavorite = false,
  }) : super(key: key);

  final String productName;
  final String productPrice;
  final String productLocation;
  final String imageLink;
  bool isFavorite;
  @override
  State<CardProductAd> createState() => _CardProductAdState();
}

class _CardProductAdState extends State<CardProductAd> {
  void makeFavorite() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 125,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xffa9a9a9),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 125,
                width: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.imageLink,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border: Border.all(
                    width: 0.5,
                    color: Color.fromARGB(255, 192, 180, 225),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  makeFavorite();
                },
                icon: Icon(
                  widget.isFavorite ? Icons.star :  Icons.star_border,
                  color: (
                    widget.isFavorite
                      ? Color.fromARGB(
                          255,
                          99,
                          66,
                          191,
                        )
                      : Colors.grey),
                ),
                splashRadius: 1,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'R\$ ' + widget.productPrice,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.productLocation,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
