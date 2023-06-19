import 'package:flutter/material.dart';

import '../Screen/cartPage.dart';

class CounterBtn extends StatelessWidget {
  const CounterBtn({super.key, required this.product, required this.onPressed});
  final Product product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Buy Now'),
    );
  }
}
