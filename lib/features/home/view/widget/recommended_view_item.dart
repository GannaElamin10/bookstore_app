import 'package:bookstore_app/core/services/dio_helper.dart';
import 'package:bookstore_app/features/home/view/view_model/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bookstore_app/features/home/data/models/book_model.dart';
import 'package:bookstore_app/features/home/view/presentation/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/home_state.dart';

class RecommendedViewItem extends StatelessWidget {
  const RecommendedViewItem({super.key, required this.book});

  final Books book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(


      builder: (context, state) {
        final controller = BlocProvider.of<HomeCubit>(context);

    return InkWell(
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(bookId: book.id!),
      ),
    );
  },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          height: 150,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 555 / 700,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    book.image
                        .replaceAll("127.0.0.1", "10.0.2.2")
                        .replaceAll("192.168.1.12", "10.0.2.2"),
                    // book.image.replaceAll("127.0.0.1", "192.168.1.12") ?? "",
                    height: 180,
                    width: 140,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        height: 180,
                        width: 140,
                        child: const Icon(Icons.broken_image),
                      );
                
                    },
                  ),
                  //  CachedNetworkImage(
                  //   fit: BoxFit.fill,
                  //   imageUrl:,
                  //   errorWidget: (context, url, error) {
                  //     return const Icon(Icons.error);
                  //   },
                  // ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.title!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Author: ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: book.author,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.attach_money, color: Colors.black87),
                            const SizedBox(width: 5),
                            Text(
                              book.price!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.pinkAccent,
                              ),
                              onPressed: () {controller.addCartProduct(book.id);},
                            ),
                            ClipOval(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                ),
                                onPressed: () async {
                                  var x = await DioHelper.postData(
                                    url: '/add-to-wishlist',
                                    data: {'book_id': book.id},
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${x.data['message']}')),
                                  );
                                },
                              ),
                            ),
                          ],
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
);
  }
}
