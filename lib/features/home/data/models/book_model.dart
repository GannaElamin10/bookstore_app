class BookModel {
  Data? data;
  String? message;
  List<ErrorMessage>? error;
  int? status;

  BookModel({this.data, this.message, this.error, this.status});

  BookModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
  error = [];
  json['error'].forEach((v) {
    error!.add(ErrorMessage.fromJson(v));
  });
}
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  List<Books>? books;
  Meta? meta;
  Links? links;

  Data({this.books, this.meta, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Books {
  int? id;
  String? isbnCode;
  String? title;
  String? image;
  String? author;
  String? description;
  String? price;
  String? priceAfterDiscount;
  String? discount;
  int? stockQuantity;
  int? categoryId;
  int? publisherId;

  Books(
      {this.id,
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
      this.publisherId});

  Books.fromJson(Map<String, dynamic> json) {
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
    data['id'] = id;
    data['isbn_code'] = isbnCode;
    data['title'] = title;
    data['image'] = image;
    data['author'] = author;
    data['description'] = description;
    data['price'] = price;
    data['price_after_discount'] = priceAfterDiscount;
    data['discount'] = discount;
    data['stock_quantity'] = stockQuantity;
    data['category_id'] = categoryId;
    data['publisher_id'] = publisherId;
    return data;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? cuurentPage;
  int? lastPage;

  Meta({this.total, this.perPage, this.cuurentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    cuurentPage = json['cuurent_page'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['per_page'] = perPage;
    data['cuurent_page'] = cuurentPage;
    data['last_page'] = lastPage;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class ErrorMessage {
  final String? message;

  ErrorMessage({this.message});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
