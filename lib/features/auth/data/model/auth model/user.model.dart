import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final dynamic address;
  final dynamic city;
  final dynamic phone;
  final String? password;
  final String? image;

  const User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.password,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        address: json['address'] as dynamic,
        city: json['city'] as dynamic,
        phone: json['phone'] as dynamic,
        password: json['password'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'address': address,
        'city': city,
        'phone': phone,
        'password': password,
        'image': image,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      address,
      city,
      phone,
      password,
      image,
    ];
  }
}
