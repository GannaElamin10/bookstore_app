import 'package:bookstore_app/features/home/view/presentation/book_details.dart';
import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) =>BookDetails()));},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          height: 124,
          child: Row(
            children: [
              Image.asset(
                'assets/image/ph1.png',
                width: 93,
                height: 124,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Rich Dad And Poor Dad',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Author: ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Robert T. Kiyosaki',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.black87),
                            SizedBox(width: 5),
                            Text(
                              '40',
                              style: TextStyle(
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
                              
                              icon: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.pinkAccent),
                              onPressed: () {
                                
                              },
                            ),
                            ClipOval(
                              child: Container(
                                
                                color: Colors.white,
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  icon: Icon(Icons.favorite_border,
                                      color: Colors.pinkAccent),
                                  onPressed: () {
                                   
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
