import 'package:flutter/material.dart';
import 'package:listado_de_productos/products.dart';

class Producto extends StatelessWidget {
  final String productId;
  const Producto({super.key, required this.productId});
  @override
  Widget build(BuildContext context) {
    final product = products.firstWhere((product) => product['id'].toString() == productId);
    final reviews = product['reviews'] as List<Map<String, dynamic>>;
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text('Price: ${product['price']} €'),
            const SizedBox(height: 10),
            Text('Rating: ${product['rating']} stars'),
            const SizedBox(height: 20),
            const Text(
              'Customer Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  final review = reviews[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review['reviewerName'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(review['comment']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
