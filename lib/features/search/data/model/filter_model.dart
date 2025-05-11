class FilterModel {
  Data? data;
  String? message;
  List<String>? error;
  int? status;

  FilterModel({this.data, this.message, this.error, this.status});

  FilterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? List<String>.from(json['error']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['error'] = error;
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
      books = List<Books>.from(json['books'].map((x) => Books.fromJson(x)));
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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

  Books({
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
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta({this.total, this.perPage, this.currentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
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
    return {
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }
}
