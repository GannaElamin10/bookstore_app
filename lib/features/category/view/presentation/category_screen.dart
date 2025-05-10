import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Categories'),
      ),
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildCategoryCard(),
                    SizedBox(width: 10),
                    _buildCategoryCard(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _buildCategoryCard(),
                    SizedBox(width: 10),
                    _buildCategoryCard(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _buildCategoryCard(),
                    SizedBox(width: 10),
                    _buildCategoryCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildCategoryCard() {
    return Container(
      width: 180,
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/image/ph1.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          const Text(
            'Rich Dad And Poor Dad',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
