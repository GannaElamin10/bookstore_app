import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
     
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 23),
            child: Column(
              children: [
                Row(
  children: [
    Expanded(
      child: TextField(
        decoration: InputDecoration(
          suffixIconColor: Colors.pinkAccent,
          suffixIcon: Icon(Icons.search),
          hintText: 'Search',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    ),
    SizedBox(width: 10),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Row(
        children: const [
          Icon(Icons.filter_list, size: 20),
          SizedBox(width: 4),
          Text('Filter'),
        ],
      ),
    ),
  ],
),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    _buildBookCard(),
                    SizedBox(width: 10),
                    _buildBookCard(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _buildBookCard(),
                    SizedBox(width: 10),
                    _buildBookCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

Widget _buildBookCard() {
  return Container(
    height: 350,
    width: 180,
    color: Colors.white,
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/image/ph1.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.favorite_border, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Rich Dad And Poor Dad',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Author: ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: 'Robert T. Kiyosaki',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Icon(Icons.attach_money, color: Colors.black87, size: 18),
            Text(
              '30.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
            SizedBox(width: 6),
            Text(
              '50',
              style: TextStyle(
                fontSize: 12,
                color: Colors.pinkAccent,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Spacer(),
            Icon(
              Icons.shopping_cart,
              color: Colors.pinkAccent,
              size: 20,
            )
          ],
        ),
      ],
    ),
  );
}
