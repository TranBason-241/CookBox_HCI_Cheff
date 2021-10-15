import '/providers/products.dart';
import '/widgets/popular_item.dart';
// import 'package:app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewCart extends StatelessWidget {
  int type;
  ListViewCart(this.type);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    var products = productData.items;
    products = productData.getType(type).toList();

    // List<PopularItems> popularItems = [
    //   PopularItems(
    //       text: "Thai Me Up Restaurant &\nBrewery",
    //       image:
    //           "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    //   PopularItems(
    //       text: "Tequila Mackingbir\nGreenpoint",
    //       image:
    //           "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    //   PopularItems(
    //       text: "Tequila Mackingbir\nGreenpoint",
    //       image:
    //           "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    //   PopularItems(
    //       text: "Tequila Mackingbir\nGreenpoint",
    //       image:
    //           "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    //   PopularItems(
    //       text: "Tequila Mackingbir\nGreenpoint",
    //       image:
    //           "https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp"),
    // ];
    return Container(
      height: 280,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          // padding: EdgeInsets.only(left: 16),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: products[index],
                child: PopularItemsCard(type),
              )
          // {
          //   // return PopularItemsCard(popularItems: popularItems[index]);
          // },
          // itemBuilder: (context, index) {
          //   return PopularItemsCard(popularItems: popularItems[index]);
          // },
          ),
    );
  }
}
