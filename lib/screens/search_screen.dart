import '/providers/cart.dart';
import '/providers/products.dart';
import '/screens/cart_screen.dart';
import '/widgets/bage.dart';
import '/widgets/search_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final seachText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var productData = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: SizedBox(
          height: 37,
          child: TextField(
              controller: seachText,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                // productData = product.listSearch(value);
                // context.read<Products>().listSearch(value);
                context.read<Products>().name = value;
              },
              onSubmitted: (value) {
                Navigator.pushReplacementNamed(context, SearchScreen.routeName);
                // productData = Provider.of<Products>(context, listen: false)
                //     .listSearch(value);
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sản phẩm, công thức',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                filled: true,
                fillColor: Colors.white,
              )),
        ),
        actions: [
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch as Widget,
              value: cartData.itemCount.toString(),
              color: Colors.red,
            ),
            child: IconButton(
              icon: Icon(Icons.local_mall_outlined),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<Products>(
              builder: (BuildContext context, value, Widget? child) {
                return ListView.builder(
                  itemCount: value.searchList.length,
                  itemBuilder: (ctx, i) => SearchItem(
                    id: value.searchList[i].id,
                    price: value.searchList[i].price,
                    description: value.searchList[i].description,
                    title: value.searchList[i].title,
                    img: value.searchList[i].imageUrl,
                    // img:
                    //     'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: productData.length,
          //     itemBuilder: (ctx, i) => SearchItem(
          //       id: productData[i].id,
          //       price: productData[i].price,
          //       description: productData[i].description,
          //       title: productData[i].title,
          //       img: productData[i].imageUrl,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}


/**
 *  SizedBox(height: 10),
          Card(
            child: Row(
              children: [
                Image.network(
                  'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name of product'),
                      Text('Product Price'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.remove_circle),
                    // ),
                    // Text('1'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                ),
              ],
            ),
          ),
 */
