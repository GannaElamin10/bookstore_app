import 'package:bookstore_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BestSellerViewItem extends StatelessWidget {
  final Books book;

  const BestSellerViewItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    debugPrint("Ganna: ");
    debugPrint(book.image.replaceAll("127.0.0.1", "192.168.1.12") );
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              book.image.replaceAll("127.0.0.1", "10.0.2.2")
                    .replaceAll("192.168.1.12", "10.0.2.2"),
              // book.image.replaceAll("127.0.0.1", "192.168.1.12") ?? "",
              height: 180,
              width: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Print detailed error information
                print('=== Image Loading Error ===');
                print('Error: ');
                print('Image URL: ${book}');

                print('Error Type: ${error.runtimeType}');
                print('Stawck Trace: $stackTrace');
                print('========================');

                return Container(
                  color: Colors.grey[300],
                  height: 180,
                  width: 140,
                  child: const Icon(Icons.broken_image),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
