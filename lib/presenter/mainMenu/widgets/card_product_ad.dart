import 'package:flutter/material.dart';

class CardProductAd extends StatelessWidget {
  const CardProductAd({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productLocation, required this.imageLink,
  }) : super(key: key);

  final String productName;
  final String productPrice;
  final String productLocation;
  final String imageLink;

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
          Container(
            height: 125,
            width: 190,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageLink,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'R\$ ' + productPrice,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    productLocation,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
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
