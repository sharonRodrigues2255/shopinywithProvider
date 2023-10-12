import 'package:flutter/material.dart';
import 'package:shoppingprovider/db/db.dart';
import 'package:shoppingprovider/model/cart_model.dart';
import 'package:shoppingprovider/views/itempage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "search anything",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    width: 40,
                    height: 40,
                    color: Colors.black,
                    child: Icon(
                      Icons.sort_sharp,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: shirtsDatabase.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .8,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final data = shirtsDatabase[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemPage(
                              cartModel: CartModel(
                                  name: data["name"],
                                  description: data['description'],
                                  imagePath: data['imagePath'],
                                  price: data['price'],
                                  quantity: 1),
                            ))),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(data["imagePath"]))),
                          ),
                          Text(
                            data["name"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(data["price"].toString())
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
