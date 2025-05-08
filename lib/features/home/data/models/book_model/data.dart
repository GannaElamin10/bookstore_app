import 'package:equatable/equatable.dart';

import 'slider.dart';

class Data extends Equatable {
  final List<Slider>? slider;

  const Data({this.slider});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        slider: (json['slider'] as List<dynamic>?)
            ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'slider': slider?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [slider];
}
