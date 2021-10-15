import 'dart:math';

import '/providers/cart.dart';
import '/providers/product.dart';
import '/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularItems {
  String text;
  String image;
  PopularItems({required this.text, required this.image});
}

class PopularItemsCard extends StatelessWidget {
  // PopularItems popularItems;
  // PopularItemsCard({required this.popularItems});
  int type;
  PopularItemsCard(this.type);

  List<PopularItems> popularItems = [
    PopularItems(
        text: "Thai Me Up Restaurant &\nBrewery",
        image:
            "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    PopularItems(
        text: "Tequila Mackingbir\nGreenpoint",
        image:
            "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    PopularItems(
        text: "Tequila Mackingbir\nGreenpoint",
        image:
            "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    PopularItems(
        text: "Tequila Mackingbir\nGreenpoint",
        image:
            "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    PopularItems(
        text: "Tequila Mackingbir\nGreenpoint",
        image:
            "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
  ];
  @override
  Widget build(BuildContext context) {
    int number = new Random().nextInt(4) + 2;
    final product = Provider.of<Product>(
      context,
      listen: false,
    );
    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: product.id,
        );
      },
      child: Container(
        padding: EdgeInsets.only(right: 3),
        height: 274,
        width: 150,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                // child: Image.network(
                //   // widget.popularItems.image,
                //   product.imageUrl,
                //   height: 120,
                //   width: 140,
                //   fit: BoxFit.cover,
                // ),
                child: Image.asset(
                  // widget.popularItems.image,
                  product.imageUrl,
                  height: 120,
                  width: 140,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   // widget.popularItems.text,
              //   'Lẩu Bao Tử Hầm Tiêussssss',
              //   // style: TextStyle(fontWeight: FontWeight.w600),
              // ),,
              Container(
                height: 45,
                child: Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    // color: Colors.grey,
                    color: Color(0xff333333),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      '$number',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "4.3 ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  // Text(
                  //   "(28 reviews)",
                  //   style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  type == 2
                      ? Text(
                          '${(product.price / 2).toInt()}đ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            wordSpacing: 0.2,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Text(
                          '${(product.price).toInt()}đ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            wordSpacing: 0.2,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  type == 2
                      ? Text(
                          '${product.price.toInt().toString().substring(0, 2)}k',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 16,
                            wordSpacing: 0.2,
                            letterSpacing: 0.3,
                          ),
                        )
                      : Text(''),
                  SizedBox(
                    // height: 18.0,
                    width: 30,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        size: 24,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print(product.imageUrl);
                        cart.addItem(product.id, product.imageUrl,
                            product.price, product.title);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
