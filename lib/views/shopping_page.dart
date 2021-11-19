import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/cart_controller.dart';
import 'package:getx_tutorial/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.products[index].productName}",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      "${controller.products[index].productDescription}",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${controller.products[index].price}",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCard(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text("Add to Cart"),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              "Total amount:\$ ${controller.totalPrice}",
              style: TextStyle(fontSize: 32, color: Colors.white),
            );
          }),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(controller.count.toString(),style: TextStyle(fontSize: 24,color: Colors.black),);
          }
        ),
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
