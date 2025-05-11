class SearchModel {
  final Data? data;
  final String? message;
  final List<String>? error;
  final int? status;

  SearchModel({this.data, this.message, this.error, this.status});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      error: json['error'] != null ? List<String>.from(json['error']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (data != null) 'data': data!.toJson(),
      'message': message,
      if (error != null) 'error': error,
      'status': status,
    };
  }
}

class Data {
  final List<Books> books;
  final Meta? meta;
  final Links? links;

  Data({this.books = const [], this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      books: (json['books'] as List<dynamic>?)
              ?.map((e) => Books.fromJson(e))
              .toList() ??
          [],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'books': books.map((e) => e.toJson()).toList(),
      if (meta != null) 'meta': meta!.toJson(),
      if (links != null) 'links': links!.toJson(),
    };
  }
}

class Books {
  final int id;
  final String isbnCode;
  final String title;
  final String image;
  final String author;
  final String description;
  final String price;
  final String priceAfterDiscount;
  final String discount;
  final int stockQuantity;
  final int categoryId;
  final int publisherId;

  Books({
    this.id = 0,
    this.isbnCode = '',
    this.title = '',
    this.image = '',
    this.author = '',
    this.description = '',
    this.price = '',
    this.priceAfterDiscount = '',
    this.discount = '',
    this.stockQuantity = 0,
    this.categoryId = 0,
    this.publisherId = 0,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    final String rawImage = json['image'] ?? '';
    final String fullImage = rawImage.isNotEmpty
        ? 'http://127.0.0.1:8000/upload/books/$rawImage'
        : '';

    return Books(
      id: json['id'] ?? 0,
      isbnCode: json['isbn_code'] ?? '',
      title: json['title'] ?? '',
      image: fullImage,
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      priceAfterDiscount: json['price_after_discount'] ?? '',
      discount: json['discount'] ?? '',
      stockQuantity: json['stock_quantity'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      publisherId: json['publisher_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
  }
}

class Meta {
  final int total;
  final int perPage;
  final int currentPage;
  final int lastPage;

  Meta({
    this.total = 0,
    this.perPage = 0,
    this.currentPage = 0,
    this.lastPage = 0,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] ?? 0,
      perPage: json['per_page'] ?? 0,
      currentPage: json['current_page'] ?? 0,
      lastPage: json['last_page'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'per_page': perPage,
      'current_page': currentPage,
      'last_page': lastPage,
    };
  }
}

class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  Links({this.first, this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }
}
