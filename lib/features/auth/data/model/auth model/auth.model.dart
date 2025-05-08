import 'package:equatable/equatable.dart';

import 'data.model.dart';

class Auth extends Equatable {
  final Data? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  const Auth({this.data, this.message, this.error, this.status});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };

  @override
  List<Object?> get props => [data, message, error, status];
}
