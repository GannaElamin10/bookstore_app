class Books {
  int? id;
  String? title;
  String? author;
  String? image;
  String? price;
  String? priceAfterDiscount;

  Books({
    this.id,
    this.title,
    this.author,
    this.image,
    this.price,
    this.priceAfterDiscount,
  });

  Books.fromJson(Map<String, dynamic> json) {
    const String baseUrl = "http://localhost:8000/storage/";

    id = json['id'];
    title = json['title'];
    author = json['author'];
    image = json['image'] != null ? baseUrl + json['image'] : null;
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
  }
}



class BookModel {
  final int id;
  final String isbnCode;
  final String title;
  final String image;
  final String author;
  final String description;
  final String price;
  final String? priceAfterDiscount;
  final String? discount;
  final int stockQuantity;
  final int categoryId;
  final int publisherId;

  BookModel({
    required this.id,
    required this.isbnCode,
    required this.title,
    required this.image,
    required this.author,
    required this.description,
    required this.price,
    this.priceAfterDiscount,
    this.discount,
    required this.stockQuantity,
    required this.categoryId,
    required this.publisherId,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      isbnCode: json['isbn_code'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      priceAfterDiscount: json['price_after_discount'],
      discount: json['discount'],
      stockQuantity: json['stock_quantity'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      publisherId: json['publisher_id'] ?? 0,
    );
  }
}
class WishlistModel {
  final List<BookModel> books;
  final String message;
  final int status;

  WishlistModel({
    required this.books,
    required this.message,
    required this.status,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      books: (json['data']['books'] as List)
          .map((book) => BookModel.fromJson(book))
          .toList(),
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}


class BookDetails {
  Data? data;
  String? message;
  List<String>? error; // تغيير نوع error من List<Null> إلى List<String>
  int? status;

  BookDetails({this.data, this.message, this.error, this.status});

  BookDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = List<String>.from(json['error']);
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error;
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  Book? book;

  Data({this.book});

  Data.fromJson(Map<String, dynamic> json) {
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    return data;
  }
}

class Book {
  int? id;
  String? isbnCode;
  String? title;
  String? image;
  String? author;
  String? description;
  String? price;
  String? priceAfterDiscount; // تغيير Null إلى String؟
  String? discount; // تغيير Null إلى String؟
  int? stockQuantity;
  int? categoryId;
  int? publisherId;

  Book({
    this.id,
    this.isbnCode,
    this.title,
    this.image,
    this.author,
    this.description,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.stockQuantity,
    this.categoryId,
    this.publisherId,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isbnCode = json['isbn_code'];
    title = json['title'];
    image = json['image'];
    author = json['author'];
    description = json['description'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    discount = json['discount'];
    stockQuantity = json['stock_quantity'];
    categoryId = json['category_id'];
    publisherId = json['publisher_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['isbn_code'] = this.isbnCode;
    data['title'] = this.title;
    data['image'] = this.image;
    data['author'] = this.author;
    data['description'] = this.description;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['discount'] = this.discount;
    data['stock_quantity'] = this.stockQuantity;
    data['category_id'] = this.categoryId;
    data['publisher_id'] = this.publisherId;
    return data;
  }
}
