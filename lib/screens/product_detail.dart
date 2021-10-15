import '/providers/cart.dart';
import '/providers/product.dart' show Product;
import '/providers/products.dart';
import '/screens/cart_screen.dart';
import '/widgets/bage.dart';
import '/widgets/product_grid.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List listRecipe = [
    {
      'image':
          'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
      'description':
          "bạn trộn nước xốt ướp gà theo công thức: 2 muỗng canh nước mắm, 1 muỗng cà phê muối, 2 muỗng canh dầu ăn, 2 muỗng cà phê đường, 1 muỗng cà phê bột ngọt, 1/2 muỗng cà phê tiêu, 4 trái ớt giã nhuyễn, khuấy đều."
    },
    {
      'image':
          'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
      'description':
          'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'
    },
    {
      'image':
          'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
      'description': 'Trình Bày Và Thưởng Thức'
    },
  ];
  List listTaste = [
    {'taste': 'Cay'},
  ];
  List listIng = [
    {'name': 'Gà ', 'Luong': 1500},
    {'name': 'Muối', 'Luong': 100},
    {'name': 'tiêu', 'Luong': 50},
    {'name': 'ớt bột', 'Luong': 150}
  ];
  int lv = 3;
  @override
  updateState(String operator) {
    if (operator.compareTo('add') == 0) {
      if (lv < 5) {
        this.setState(() {
          lv += 1;
          listIng[2]['Luong'] = listIng[2]['Luong'] + 10;
          listIng[3]['Luong'] = listIng[2]['Luong'] + 10;
        });
      }
    } else {
      if (lv > 1) {
        this.setState(() {
          lv -= 1;
          listIng[2]['Luong'] = listIng[2]['Luong'] - 10;
          listIng[3]['Luong'] = listIng[2]['Luong'] - 10;
        });
      }
    }
  }
  // void startAddNewTransaction(BuildContext ctx) {
  // showModalBottomSheet(
  //     context: ctx,
  //     builder: (bCtx) {
  //       return Text('Helelo');
  //     });
  //   showModalBottomSheet(
  //       context: ctx,
  //       builder: (bCtx) {
  //         return Container(
  //           height: 350.0,
  //           color: Colors.transparent, //could change this to Color(0xFF737373),
  //           //so you don't have to change MaterialApp canvasColor
  //           child: Container(
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: const Radius.circular(10.0),
  //                       topRight: const Radius.circular(10.0))),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       IconButton(
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                         },
  //                         icon: const Icon(
  //                           Icons.cancel_outlined,
  //                           color: Colors.orange,
  //                           size: 25,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: MediaQuery.of(context).size.width / 4,
  //                       ),
  //                       Text(
  //                         'Tùy chọn',
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Divider(
  //                     color: Colors.black,
  //                   ),
  //                   Text(''),
  //                 ],
  //               )),
  //         );
  //       });

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          // return Container(
          //   // height: 300,
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           IconButton(
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //             icon: Icon(Icons.clear),
          //           ),
          //         ],
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 19),
          //         child: Row(
          //           children: const [
          //             Text(
          //               'Tùy chỉnh',
          //               style: TextStyle(
          //                 fontSize: 18,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Center(
          //                   child: Container(
          //                     height: 100,
          //                     width: 100,
          //                     child: Image.network(
          //                       'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
          //                       fit: BoxFit.cover,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 RichText(
          //                   text: const TextSpan(
          //                     text: 'Shornam',
          //                     style: TextStyle(color: Colors.amber),
          //                     children: [
          //                       TextSpan(
          //                           text: '\nNike',
          //                           style: TextStyle(color: Colors.black12))
          //                     ],
          //                   ),
          //                 ),
          //                 Text('kdkdkdk'),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text('hjhszxxh'),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // );

          // 2

          int itemCount = 0;
          return Stack(
            children: [
              Container(
                height: 200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.clear),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.8,
                        ),
                        Text(
                          'Tùy chọn ',
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    ListTile(
                      // on ListItem clicked
                      onTap: () {},

                      // Image of ListItem
                      leading: Container(
                        child: Image(
                          fit: BoxFit.fitHeight,
                          // image: NetworkImage(
                          //     'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp'),
                          image: AssetImage('assets/images/gaNuong.jpg'),
                        ),
                      ),

                      // Lists of titles
                      title: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        height: 80.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 2.0),
                              child: Text(
                                "Gà Nướng Muối Ớt",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 3.0),
                              child: Text(
                                "400Gr",
                                style: TextStyle(),
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(bottom: 3.0),
                            //   child: Text(
                            //     "500 RS",
                            //     style: TextStyle(color: Color(0xff374ABE)),
                            //   ),
                            // ),
                          ],
                        ),
                      ),

                      // Item Add and Remove Container
                      // subtitle: Container(
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text(context.watch<Products>().counter.toString()),
                          Spacer(),
                          Consumer<Products>(
                            builder: (context, value, child) {
                              return Text((value.count * 100).toString());
                            },
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey),
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    if (itemCount < 0) {
                                      itemCount = 0;
                                    } else {
                                      itemCount--;
                                    }
                                    // setState(() {
                                    //   itemCount;
                                    // });
                                    // context.read<Products>().counter;
                                    itemCount =
                                        context.read<Products>().divCounter();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 19.0,
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0, top: 1.0, right: 10.0),
                                    // context.watch<Products>().counter.toString(),
                                    child: Consumer<Products>(
                                      builder: (context, value, child) {
                                        return Text(value.count.toString());
                                      },
                                    )),

                                // Add count button
                                GestureDetector(
                                  onTap: () {
                                    // itemCount++;

                                    itemCount =
                                        context.read<Products>().addCounter();
                                    // setState(() {
                                    //   itemCount =
                                    //       context.read<Products>().addCounter();
                                    //   print('item count' + itemCount.toString());
                                    // });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 19.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // trailing shows the widget on the right corner of the list item
                      // trailing: Icon(Icons.cancel),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: GestureDetector(
                          onTap: () {
                            // startAddNewTransaction(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.local_mall_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
        backgroundColor: Color(0xfff32726),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(Icons.share),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch as Widget,
              value: cartData.itemCount.toString(),
              color: Colors.red,
            ),
            child: IconButton(
              icon: Icon(Icons.local_mall_outlined),
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed(CartScrren.routeName);
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Expanded(  child:
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      color: const Color(0xffacfff),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          // image: NetworkImage(loadedProduct.imageUrl))),
                          // image: NetworkImage(loadedProduct.imageUrl))),
                          image: AssetImage('assets/images/gaNuong.jpg'))),
                ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loadedProduct.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.local_mall_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('2.0k'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.thumb_up_off_alt,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('21'),
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset("assets/images/star_filled.png"),
                          const SizedBox(
                            width: 1,
                          ),
                          const Text(
                            "4.9",
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text('(124 đánh giá)')
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            loadedProduct.price.toString() + '00đ',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            '/ 200Gr/Phần',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 1050,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCustomTaste(),
                      buildNutrients(),
                      buildIngredient(),
                      buildDescription(),
                      buildRecipe(),
                      // Text(
                      //   'Mô tả',
                      //   style: TextStyle(color: Colors.amber, fontSize: 20),
                      // ),
                      // Text(
                      //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                      //   style: TextStyle(color: Colors.black, fontSize: 16),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        startAddNewTransaction(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.local_mall_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Thêm vào giỏ hàng',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIngredient() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thành phần",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                child: Column(
              children: [
                ...listIng.map((v) => Row(
                      children: [
                        Text("${v['name']}"),
                        Text(":   ${v['Luong']}")
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildCustomTaste() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Điều chỉnh theo khẩu vị của bạn",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Text(
            "Điều chỉnh các vị cơ bản của món ăn",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: [
              ...listTaste.map((taste) => Row(
                    children: [
                      Text(
                        "${taste['taste']}: ",
                        style: TextStyle(color: Colors.red, fontSize: 22),
                      ),
                      // CustomIconButton(
                      //     backgroundColor: Colors.black.withOpacity(0.2),
                      //     icon: Icon(Icons.remove, size: 16),
                      //     onPressed: () => updateState('remove'),
                      //     margin: EdgeInsets.all(0)),
                      IconButton(
                        onPressed: () {
                          updateState('remove');
                        },
                        icon: Icon(Icons.remove_circle),
                      ),
                      Text(
                        "cấp ${lv}",
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          updateState("add");
                        },
                        icon: Icon(Icons.add_circle),
                      ),
                      // CustomIconButton(
                      //     backgroundColor: Colors.black.withOpacity(0.2),
                      //     icon: Icon(
                      //       Icons.add,
                      //       size: 16,
                      //     ),
                      //     onPressed: () {
                      //       updateState("add");
                      //     },
                      //     margin: EdgeInsets.all(0)),
                      Text("${lv == 3 ? '(nguyên bản)' : ''}")
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget buildNutrients() {
    List list = [
      {'name': 'Calories', 'Luong': 1500 + 200},
    ];
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dinh Dưỡng",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                child: Column(
              children: [
                ...list.map((v) => Row(
                      children: [
                        Text("${v['name']}"),
                        Text(":   ${v['Luong']}")
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mô tả",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
              "Món gà nướng muối ớt thơm lừng có lớp da giòn, thịt mềm thấm vị mặn của muối, vị cay nồng của ớt chinh phục cả những người ăn khó tính và trở thành món ăn được rất nhiều người ưa chuộng.")
        ],
      ),
    );
  }

  Widget buildRecipe() {
    int counter = 0;
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hướng dẫn",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          ...listRecipe.map((
            v,
          ) =>
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bước ${++counter}"),
                    Container(
                      width: 170,
                      child: Material(
                        elevation: 10,
                        child: Image.network('${v['image']}'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${v['description']}",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                ),
              ))
          // Column(
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [

          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}

class proDes extends StatelessWidget {
  Widget icon;
  String t1;
  String t2;

  proDes({required this.icon, required this.t1, required this.t2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(
            '$t1',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            '$t2',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
