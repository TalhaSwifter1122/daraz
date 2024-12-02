import 'package:daraz_web/view_model.dart/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridWidget extends StatelessWidget {
  final int crossAxisCount;

  const ProductGridWidget({super.key, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    final products = viewModel.filteredProducts;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2 / 3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("\$${product.price}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.category),
              ),
            ],
          ),
        );
      },
    );
  }
}
