import 'package:flutter/material.dart';

class MyColors {
  static final primary = const Color(0xFF2A2F3D);
  static final heart = const Color(0xFFFF4F61);
  static final secondary = const Color(0xFF7984A1);
  const MyColors();
}

class Blog {
  final String description;
  final ImageProvider<Object> image;
  final String title;
  final String date;
  final int imgIdx;
  const Blog(this.image, this.description, this.title, this.date, this.imgIdx);
}

class Store {
  static final List<Blog> blogs = [
    Blog(
        AssetImage('assets/images/tokyo bg card back 1.png'),
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique totam nam fugiat facere cumque voluptates illum alias cum. Exercitationem, placeat?",
        "Tokyo Temple",
        "March 30, 2020",
        0),
    Blog(
        AssetImage("assets/images/tokyo bg.jpeg"),
        "Tokyo comes to life at night. The best places to experience nightlife in Tokyo are Shinjuku, Shibuya, Ginza, Roppongi and Tokyo Tower. In Tokyo we also have",
        "Trip to Tokyo",
        "March 21, 2019",
        1),
    Blog(
        AssetImage("assets/images/tokyo bg card back 2.png"),
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique totam nam fugiat facere cumque voluptates illum alias cum. Exercitationem, placeat?",
        "Tokyo Lakes",
        "March 5, 2021",
        2),
  ];
  const Store();
}
