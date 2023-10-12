import 'package:flutter/material.dart';
import 'package:shoppingprovider/db/db.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final data = shirtsDatabase[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(data["imagePath"]))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  data["description"],
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text("")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
