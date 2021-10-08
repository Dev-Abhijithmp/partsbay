import 'dart:core';

class Items {
  late String catagory;
  late String title;
  late String vendor;
  late String description;
  late double price;
  late int count;
  late List<String> sizes;
  Items(String catagory, String title, String vendor, String description,
      double price, int count, List<String> sizes) {
    this.catagory = catagory;
    this.title = title;
    this.vendor = vendor;
    this.description = description;
    this.price = price;
    this.count = count;
    this.sizes = sizes;
  }
}
