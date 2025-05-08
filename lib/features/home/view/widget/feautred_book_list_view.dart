import 'package:bookstore_app/core/widgets/custom_error_widget.dart';
import 'package:bookstore_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookstore_app/features/home/view/presentation/manger/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookstore_app/features/home/view/presentation/manger/featured_books_cubit/featured_book_state.dart';
import 'package:bookstore_app/features/home/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
        builder: (context, state) {
      if (state is FeaturedBookSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomListViewItem();
            },
          ),
        );
      } else if (state is FeaturedBookFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return CustomLoadingIndicator();
      }
    });
  }
}
