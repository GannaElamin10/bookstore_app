import 'package:bookstore_app/core/services/dio_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bookstore_app/features/home/data/models/book_model.dart';
import 'package:bookstore_app/features/home/view/presentation/book_details.dart';
import 'package:flutter/material.dart';

class RecommendedViewItem extends StatefulWidget {
  const RecommendedViewItem({super.key, required this.book,this.showDiscount=false});

  final BookModel book;
  final bool showDiscount;

  @override
  State<RecommendedViewItem> createState() => _RecommendedViewItemState();
}

class _RecommendedViewItemState extends State<RecommendedViewItem> {
  bool isInWishlist = false;

  Future<void> toggleWishlist() async {
    if (widget.book.isFavourite) {
      var response = await DioHelper.postData(
        url: '/remove-from-wishlist',
        data: {'book_id': widget.book.id},
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.data['message']}')),
      );
    } else {
      var response = await DioHelper.postData(
        url: '/add-to-wishlist',
        data: {'book_id': widget.book.id},
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.data['message']}')),
      );
    }

    setState(() {
      widget.book.isFavourite=!widget.book.isFavourite;

      isInWishlist = !isInWishlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

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
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: '${book.image}',
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error);
                    },
                  ),
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
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("EGP"),
                            // const Icon(Icons.attach_money, color: Colors.black87),
                            const SizedBox(width: 5),
                            Text(
                             "${widget.showDiscount?book.priceAfterDiscount: book.price}",
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
                              onPressed: () {},
                            ),
                            ClipOval(
                              child: IconButton(
                                icon: Icon(
                                  book.isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.pink,
                                ),
                                onPressed: toggleWishlist,
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
  }
}
