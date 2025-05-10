import 'package:bookstore_app/core/icons/wish_list_icon.dart';
import 'package:bookstore_app/features/home/view/presentation/all_books_screen.dart';
import 'package:bookstore_app/features/home/view/view_model/home_cubit.dart';
import 'package:bookstore_app/features/home/view/view_model/home_state.dart';
import 'package:bookstore_app/features/home/view/widget/book_list_view_item.dart';
import 'package:bookstore_app/features/home/view/widget/custom_list_view_item.dart';
import 'package:bookstore_app/features/home/view/widget/feautred_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getlimitBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          actions: [WishListIcon()],
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  // SliverToBoxAdapter(
                  //     child: Padding(
                  //       padding: EdgeInsets.all(8),
                  //       child: Text(
                  //         'Best Seller',
                  //         style:
                  //             TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ),
                  //   SliverToBoxAdapter(child: FeaturedBookListView()),
                  //   SliverToBoxAdapter(
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Recommended for you',
                  //             style: TextStyle(
                  //                 fontSize: 16, fontWeight: FontWeight.bold),
                  //           ),
                  //           TextButton.icon(
                  //             onPressed: () {
                  //               Navigator.of(context).push(MaterialPageRoute(
                  //                   builder: (context) => AllBooksScreen()));
                  //             },
                  //             icon: Icon(Icons.arrow_forward, color: Colors.pink),
                  //             label: Text(
                  //               'See All',
                  //               style: TextStyle(color: Colors.pink),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   // SliverToBoxAdapter(child: CustomListViewItem()),
                  state is GetLimitBooksLoadingState
                      ? CircularProgressIndicator()
                      : state is GetLimitBooksSucessState
                          ? SizedBox(
                              height: 500,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  
                                  return BookListViewItem(book: HomeCubit().get(context).books![index],);
                                },
                                itemCount: 2,
                              ),
                            )
                          : Text('somthing want wrong'),
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           ' Flash Sale',
                  //           style: TextStyle(
                  //               fontSize: 16, fontWeight: FontWeight.bold),
                  //         ),
                  //         TextButton.icon(
                  //           onPressed: () {
                  //             Navigator.of(context).push(MaterialPageRoute(
                  //                 builder: (context) => AllBooksScreen()));
                  //           },
                  //           icon: Icon(Icons.arrow_forward, color: Colors.pink),
                  //           label: Text(
                  //             'See All',
                  //             style: TextStyle(color: Colors.pink),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SliverToBoxAdapter(child: CustomListViewItem()),
                  // SliverList(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (context, index) => BookListViewItem(),
                  //     childCount: 2,
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}