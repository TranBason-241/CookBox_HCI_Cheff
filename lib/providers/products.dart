import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Gà Nướng Muối Ớt',
    //   description: 'A red shirt - it is pretty red! shirt - it is pretty red!',
    //   price: 90000,
    //   imageUrl: 'assets/images/gaNuong.jpg',
    //   type: 1,
    // ),
    Product(
      id: 'p7',
      title: 'Vịt Kho Măng',
      description: 'Vịt tươi, măng hữu cơ.',
      price: 20000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/pack1.jpg',
      type: 1,
    ),
    Product(
      id: 'p9',
      title: 'Chả Bò Gân Ớt',
      description: 'Prepare any meal you want.',
      price: 20000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/bo1.jpg',
      type: 1,
    ),
    Product(
      id: 'p9',
      title: 'Gà Nướng Muối Ớt',
      description: 'Cay giòn đậm vị thịt mềm thắm gia vị',
      price: 90000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/gaNuong.jpg',
      type: 1,
    ),
    Product(
      id: 'p2',
      title: 'Gà Ta Kho Sả Ớt',
      description: 'A nice pair of trousers.',
      price: 40000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/pack4.jpg',
      type: 2,
    ),
    Product(
      id: 'p3',
      title: 'Vịt Kho Gừng',
      description: 'Thơm ngọt của vịt, vị ấm nòng của vị',
      price: 56000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/pack5.jpg',
      type: 2,
    ),
    Product(
      id: 'p4',
      title: 'Cá Kèo Kho Rau Răm',
      description: 'Prepare any meal you want.',
      price: 90000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/pack6.jpg',
      type: 2,
    ),
    Product(
      id: 'p5',
      title: 'Chả Bò Gân Ớt',
      description: 'Prepare any meal you want.',
      price: 45000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/bo1.jpg',
      type: 3,
    ),
    // Product(
    //   id: 'p6',
    //   title: 'Cá Kèo Kho Tiêu',
    //   description: 'Prepare any meal you want.',
    //   price: 30000,
    //   imageUrl:
    //       // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
    //       'assets/images/gaNuong.jpg',
    //   type: 3,
    // ),
    Product(
      id: 'p9',
      title: 'Thịt Kho Mắm Ruốt',
      description: 'Prepare any meal you want.',
      price: 20000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/pack2.jpg',
      type: 3,
    ),
    // Product(
    //   id: 'p10',
    //   title: 'Cá Kèo Kho Ga',
    //   description: 'Prepare any meal you want.',
    //   price: 20000,
    //   imageUrl:
    //       // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
    //       'assets/images/gaNuong.jpg',
    //   type: 3,
    // ),
    Product(
      id: 'p11',
      title: 'Mực Nướng',
      description: 'Giòn cay, đậm từng vị',
      price: 20000,
      imageUrl:
          // 'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          'assets/images/mucnuong.jpg',
      type: 3,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> getType(int type) {
    if (type == 1) return _items.where((element) => element.type == 1).toList();
    if (type == 2) return _items.where((element) => element.type == 2).toList();
    return _items.where((element) => element.type == 3).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Product> listSearch(String name) {
    if (name.isEmpty) return [];
    return _items
        .where((productIem) => productIem.title.contains(name))
        .toList();
  }

  String name = '{}';
  List<Product> get searchList {
    int l = listSearch(name).length;
    print(l);
    return listSearch(name);
  }

  int count = 1;
  int get counter => count;
  int addCounter() {
    count++;

    notifyListeners();
    return count;
  }

  int divCounter() {
    if (count <= 1) {
      count = 1;
    } else {
      count--;
    }

    notifyListeners();
    return count;
  }
}
