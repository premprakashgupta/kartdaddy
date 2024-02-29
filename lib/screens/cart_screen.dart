import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/box_shadow_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/data/demo_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartList = DemoData.demoProductData;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  // Calculate total price of items in the cart
  void calculateTotal() {
    total = 0.0;
    for (var product in cartList) {
      total += product['quantity'] * product['price'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> product = cartList[index];

          return Dismissible(
            key: Key(product['productTitle']),
            onDismissed: (direction) {
              setState(() {
                cartList.removeAt(index);
                total -= product['quantity'] * product['price'];
              });
            },
            child: BoxShadowContainer(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
              child: Container(
                padding: const EdgeInsets.all(13),
                height: 300,
                child: Row(
                  children: [
                    // First 40% section
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              DemoData.slideImage[index],
                              fit: BoxFit.cover,
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.width*.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.grey.shade300,
                                            Colors.white
                                          ],
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // Add your logic for decreasing quantity
                                        },
                                        child: product['quantity'] < 2
                                            ? const Icon(Icons.delete, size: 19)
                                            : const Icon(Icons.minimize_outlined,
                                                size: 19),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                          border: Border.symmetric(
                                              vertical: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey))),
                                      child: Text(
                                        '${product['quantity']}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.grey.shade300,
                                            Colors.white
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // Add your logic for decreasing quantity
                                        },
                                        child: const Icon(Icons.add, size: 19),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Second 60% section
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(text: product['productTitle'],maxLines: 2,),
                                const Gap(10),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.red.shade900),
                                      child: const Text(
                                        "10% off",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Gap(10),
                                    Text(
                                      "Limited time deal",
                                      style: TextStyle(
                                          color: Colors.red.shade900,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                NormalText(
                                  text: 'Price: ${product['price']}',
                                  size: 15,
                                ),
                                const NormalText(
                                  text: 'In Stock',
                                  size: 15,
                                ),
                                NormalText(
                                  text: '7 Day Replacement',
                                  size: 15,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Add your logic for deleting
                                  setState(() {
                                    cartList.removeAt(index);
                                    total -=
                                        product['quantity'] * product['price'];
                                  });
                                },
                                child: const NormalText(text: 'Delete', size: 13),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  // Add your logic for saving for later
                                },
                                child: const NormalText(
                                  text: 'Save for Later',
                                  size: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-2, -2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: NormalText(text: "\$ $total"),
              ),
              Expanded(
                flex: 3,
                child: CustomButton(
                  child: const Text('Checkout'),
                  onPressed: () {
                    // Add your checkout logic here
                    print('Checkout button pressed!');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
