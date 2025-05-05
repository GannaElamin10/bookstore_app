import 'package:flutter/material.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
       appBar: AppBar(
       
       leading:  IconButton(onPressed: (){Navigator.pop(context);}, 
       icon: Icon(Icons.arrow_back),
      ),),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                
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
}
