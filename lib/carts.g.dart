// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

import 'carts.dart';

Carts _$CartsFromJson(Map<String, dynamic> json) => Carts(
      id: (json['id'] as num?)?.toInt(),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toDouble(),
      discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
      userId: (json['userId'] as num?)?.toInt(),
      totalProducts: (json['totalProducts'] as num?)?.toInt(),
      totalQuantity: (json['totalQuantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartsToJson(Carts instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'total': instance.total,
      'discountedTotal': instance.discountedTotal,
      'userId': instance.userId,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'discountPercentage': instance.discountPercentage,
      'discountedTotal': instance.discountedTotal,
      'thumbnail': instance.thumbnail,
    };
