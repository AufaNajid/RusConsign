import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final String name;
  final String description;
  final double price;
  final int rating;
  final String imageUrl;
  final int mitraId;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.mitraId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name_product'],
      description: json['desc_product'],
      price: double.parse(json['price_product']),
      rating: json['rating_product'],
      imageUrl: json['image'],
      mitraId: json['mitra_id'],
    );
  }
}