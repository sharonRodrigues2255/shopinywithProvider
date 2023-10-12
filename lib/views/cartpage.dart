import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingprovider/controller/cart_controller.dart';

class CartPge extends StatelessWidget {
  const CartPge({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: provider.cartItemLIst.length,
          itemBuilder: (context, index) {
            final data = provider.cartItemLIst[index];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 4,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image(image: AssetImage(data.imagePath)),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.name,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Price \$ ${data.price * provider.quantity}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
