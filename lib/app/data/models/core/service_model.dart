import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? category;
  final int? price;
  final String? imageUrl;
  final bool? isAvailable;
  final int? duration;
  final int? rating;

  const ServiceModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.imageUrl,
    this.isAvailable,
    this.duration,
    this.rating,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: json['price'] as int?,
      imageUrl: json['imageUrl'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      duration: json['duration'] as int?,
      rating: json['rating'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'duration': duration,
      'rating': rating,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        category,
        price,
        imageUrl,
        isAvailable,
        duration,
        rating,
      ];
}
