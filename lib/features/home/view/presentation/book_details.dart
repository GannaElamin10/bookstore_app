import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image/ph1.png',
                      height: 365,
                      width: 254,
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Image.asset(
                        'assets/image/ph1.png',
                        alignment: Alignment.bottomCenter,
                        height: 102,
                        width: 74,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Rich Dad And Poor Dad",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _isExpanded
                              ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et ultricies est. Aliquam in justo varius, sagittis neque ut, malesuada leo. Lorem ipsum dolor sit amet... consectetur adipiscing elit. Mauris et ultricies est. Aliquam in justo varius, sagittis neque ut, malesuada leo. Aliquam in justo varius, sagittis neque ut, malesuada leo.'
                              : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et ultricies est. Aliquam in justo varius, sagittis neque ut, malesuada leo.',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Text(
                            _isExpanded ? 'Read Less' : 'Read More',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.attach_money, color: Colors.black87),
                        Text(
                          '30.00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '50',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.pinkAccent,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 190),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_outlined,
                                  color: Colors.green, size: 20),
                              Text(
                                'In Stock',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Book Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    (Text(
                      'Book Title :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    Text(' Rich Dad And Poor Dad')
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    (Text(
                      'Author :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    Text(' Robert T. Kiyosaki')
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    (Text(
                      'ASIN:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    Text(' B09TWSRMCB')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
