import 'dart:core';

class Items {
  late String category;
  late String title;
  late String vendor;
  late String description;
  late double price;
  late int count;
  late List<String> sizes;
  late List<String> urls;
  Items(String catagory, String title, String vendor, String description,
      double price, int count, List<String> sizes, List<String> urls) {
    this.category = catagory;
    this.title = title;
    this.vendor = vendor;
    this.description = description;
    this.price = price;
    this.count = count;
    this.sizes = sizes;
    this.urls = urls;
  }
}

var products = [
  Items("helmets", "agv 1", "agv", "super helmet", 20000.0, 20, [
    "l",
    "m",
    "xl"
  ], [
    "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"
  ]),
  Items("helmets", "agv 1", "agv", "super helmet", 20000.0, 20, [
    "l",
    "m",
    "xl"
  ], [
    "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"
  ]),
  Items("helmets", "agv 1", "agv", "super helmet", 20000.0, 20, [
    "l",
    "m",
    "xl"
  ], [
    "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"
  ]),
  Items("helmets", "agv 1", "agv", "super helmet", 20000.0, 20, [
    "l",
    "m",
    "xl"
  ], [
    "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"
  ]),
  Items("helmets", "agv 1", "agv", "super helmet", 20000.0, 20, [
    "l",
    "m",
    "xl"
  ], [
    "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"
  ]),
  Items("helmets", "agv 1", "agv", "super helmet", 20000.0, 20, [
    "l",
    "m",
    "xl"
  ], [
    "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"
  ]),
];
