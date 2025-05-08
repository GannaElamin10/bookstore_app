import 'package:bookstore_app/core/icons/wish_list_icon.dart';
import 'package:bookstore_app/features/home/view/presentation/all_books_screen.dart';
import 'package:bookstore_app/features/home/view/widget/book_list_view_item.dart';
import 'package:bookstore_app/features/home/view/widget/custom_list_view_item.dart';
import 'package:bookstore_app/features/home/view/widget/feautred_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [WishListIcon()],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Best Seller',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(child: FeaturedBookListView()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended for you',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllBooksScreen()));
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.pink),
                    label: Text(
                      'See All',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomListViewItem()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => BookListViewItem(),
              childCount: 2,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Flash Sale',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllBooksScreen()));
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.pink),
                    label: Text(
                      'See All',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomListViewItem()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => BookListViewItem(),
              childCount: 2,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
