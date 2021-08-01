import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  // Product(
  //   id: 1,
  //   images: [
  //     "assets/images/ps4_console_white_1.png",
  //     "assets/images/ps4_console_white_2.png",
  //     "assets/images/ps4_console_white_3.png",
  //     "assets/images/ps4_console_white_4.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Wireless Controller for PS4™",
  //   price: 64.99,
  //   description: description,
  //   rating: 4.8,
  //   isFavourite: true,
  // ),

  Product(
    id: 1,
    images: ["assets/images/rdpd.png"],
    colors: [
      Colors.white,
    ],
    title: "Rich Dad Poor Dad",
    price: 100,
    description: "The Number 1 personal finance book of all time!",
  ),
  Product(
      id: 2,
      images: ["assets/images/fot.png"],
      colors: [Colors.white],
      title: "Fundamentals of \nThermodynamics",
      price: 600,
      description: "A book to help you throughout your first Semester!"),
  Product(
    id: 3,
    images: ["assets/images/thomascalc_LT.png", "assets/images/tc2.png"],
    title: "Thomas Calculus - 13th edition",
    description: "A must have book for your first semester!",
    colors: [Colors.white],
    price: 700.00,
    rating: 4.5,
  ),

  Product(
    id: 4,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 300,
    description: "",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 2000.00,
    description: "",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 300,
    description: "",
    rating: 4.1,
  ),
  Product(
    id: 7,
    images: ["assets/images/ftball2.png", "assets/images/ftball1.png"],
    colors: [
      Colors.white,
    ],
    title: "Nivia Storm \nFootball",
    price: 300,
    description: "Best Ball for Beginners",
    rating: 4.2,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
