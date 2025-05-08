import 'package:equatable/equatable.dart';

class Slider extends Equatable {
  final int? id;
  final String? isbnCode;
  final String? title;
  final String? image;
  final List <String>? author;
  final String? description;
  final String? price;
  final dynamic priceAfterDiscount;
  final dynamic discount;
  final int? stockQuantity;
  final int? categoryId;
  final int? publisherId;

  const Slider({
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

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json['id'] as int?,
        isbnCode: json['isbn_code'] as String?,
        title: json['title'] as String?,
        image: json['image'] as String?,
        author: (json['author'] as List<dynamic>?)?.cast<String>(),
        description: json['description'] as String?,
        price: json['price'] as String?,
        priceAfterDiscount: json['price_after_discount'] as dynamic,
        discount: json['discount'] as dynamic,
        stockQuantity: json['stock_quantity'] as int?,
        categoryId: json['category_id'] as int?,
        publisherId: json['publisher_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'isbn_code': isbnCode,
        'title': title,
        'image': image,
        'author': author,
        'description': description,
        'price': price,
        'price_after_discount': priceAfterDiscount,
        'discount': discount,
        'stock_quantity': stockQuantity,
        'category_id': categoryId,
        'publisher_id': publisherId,
      };

  @override
  List<Object?> get props {
    return [
      id,
      isbnCode,
      title,
      image,
      author,
      description,
      price,
      priceAfterDiscount,
      discount,
      stockQuantity,
      categoryId,
      publisherId,
    ];
  }
}
