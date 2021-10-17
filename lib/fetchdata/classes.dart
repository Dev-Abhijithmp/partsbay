import 'dart:core';

class Items {
  late int id;
  late String title;
  late String vendor;
  late String description;
  late double price;
  late int count;
  late List<dynamic> sizes;
  late List<dynamic> urls;
  Items(int id, String title, String vendor, String description, double price,
      int count, List<dynamic> sizes, List<dynamic> urls) {
    this.id = id;
    this.title = title;
    this.vendor = vendor;
    this.description = description;
    this.price = price;
    this.count = count;
    this.sizes = sizes;
    this.urls = urls;
  }
}
