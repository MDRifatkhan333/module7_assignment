import 'package:flutter/material.dart';
import 'package:module_7/widget/counterBtn.dart';

import 'Screen/cartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module 7',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 30),
    Product(name: 'Product 4', price: 40),
    Product(name: 'Product 5', price: 50),
    Product(name: 'Product 6', price: 50),
    Product(name: 'Product 7', price: 50),
    Product(name: 'Product 8', price: 50),
    Product(name: 'Product 9', price: 50),
    Product(name: 'Product 10', price: 50),
    Product(name: 'Product 11', price: 50),
    Product(name: 'Product 12', price: 50),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductList'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: Column(
              children: [
                Text('Counter: ${products[index].counter}'),
                Container(
                  height: 30,
                  child: CounterBtn(
                    product: products[index],
                    onPressed: () {
                      setState(() {
                        products[index].incrementCounter();
                        if (products[index].counter == 5) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Congratulations!'),
                                content: Text(
                                    'You\'ve bought 5 ${products[index].name}!'),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(products: products)),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
