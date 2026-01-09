//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

class Food {
  int id;
  double price;
  String title;
  String image;

  Food(this.id, this.price, this.title, this.image);
}

class Sildeitem {
  int id;
  String title;
  String title2;
  String image;

  Sildeitem(this.id, this.title, this.title2, this.image);
}

List<Food> foodlist = [
  Food(
    001,
    6.50,
    ' អាម៉ុកសាច់ត្រី',
    "https://i.pinimg.com/1200x/8c/ce/c1/8ccec1741358d39ab740ef10bc8c10ab.jpg",
  ),

  Food(
    002,
    6.5,
    'នំបញ្ចុកសម្លរខ្មែរ',
    "https://i.pinimg.com/736x/e5/d6/67/e5d66743b20bf1330c4730df1cc8e50e.jpg",
  ),

  Food(
    003,
    6.5,
    'ឆាឡុកឡាក់សាច់គោ់់',
    "https://i.pinimg.com/1200x/ac/82/74/ac82747d2c0a521650f25aa83eb1549f.jpg",
  ),

  Food(
    004,
    6.5,
    'មាន់ដុតទឹកឃ្មុំ',
    "https://i.pinimg.com/736x/cd/c3/21/cdc32186fefadfa9bf3f0b19cdd3701f.jpg",
  ),

  Food(
    005,
    6.5,
    'សម្លកកូរ',
    "https://i.pinimg.com/736x/81/8f/13/818f139c8adae48b010d9e5202348289.jpg",
  ),

  Food(
    006,
    6.5,
    'ឆាបន្លែគ្រឿងសមុទ្រ',
    "https://i.pinimg.com/1200x/25/f8/9a/25f89aad8599c6ff19d6f9f73bbade7b.jpg",
  ),

  Food(
    007,
    6.5,
    'Ramen',
    "https://i.pinimg.com/736x/13/ac/74/13ac743cf706d078e30556faf13a7cbe.jpg",
  ),

  Food(
    008,
    6.5,
    'Sushi',
    "https://i.pinimg.com/736x/09/15/1d/09151d0100060e1de5165623865f2c2b.jpg",
  ),
];

List<Sildeitem> imageList = [
  Sildeitem(
    001,
    "FOOD-MENU",
    "FOOD-MENU",
    "https://i.pinimg.com/1200x/4a/14/58/4a1458834b41c784287f475d23fd322a.jpg",
  ),

  Sildeitem(
    002,
    "ម្ហូបពេញនិយម!",
    "ជ្រក់ក្រៅឆ្នាំង",
    "https://i.pinimg.com/736x/fc/ad/27/fcad270f6a81062968b387579c37feb9.jpg",
  ),

  Sildeitem(
    003,
    "ម្ហូបពេញនិយម!",
    "ម្ហូបពេញនិយម!",
    "https://i.pinimg.com/736x/cf/f6/f7/cff6f76d99d0b3ccba7573e163e77f8e.jpg",
  ),

  Sildeitem(
    004,
    "ម្ហូបពេញនិយម!",
    "ម្ហូបពេញនិយម!",
    "https://i.pinimg.com/1200x/f2/ab/17/f2ab17198e5aba4b571f6bdc83da4714.jpg",
  ),

  Sildeitem(
    005,
    "ម្ហូបពេញនិយម!",
    "ម្ហូបពេញនិយម!",
    "https://i.pinimg.com/736x/b9/0f/eb/b90feb77b5cbdee98e5e4209267d1e48.jpg",
  ),
];
