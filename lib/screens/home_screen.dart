import '/providers/cart.dart';
import '/screens/cart_screen.dart';
// import '/screens/order_screen.dart';
import '/screens/search_screen.dart';
import '/widgets/bage.dart';
import '/widgets/custom_navbar.dart';
import '/widgets/listview_popular.dart';
import '/widgets/popular_item.dart';
// import 'package:app/widgets/product_grid.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int currentTab = 0;
  // final List<Widget> screens = [
  //   HomeScreen(),
  //   OrderScreen(),
  // ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  final List<String> images = [
    'https://cf.shopee.vn/file/b19a4998332c28c3fe1014429f12b2c5',
    'https://cdn.chanhtuoi.com/uploads/2021/07/foodmap.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD-qQL9OpIzo1logABt9hiMAEz0gpviVf8jA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRvabEVjmLblf-tX64eNpj6ZRtl_IH1weF_A&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        title: TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.fmd_good_outlined, color: Colors.white),
                Text(
                  'TP. HCM',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
              ],
            )),
        actions: [
          // Padding(
          //   padding: EdgeInsets.all(15.0),
          //   child: Icon(
          //     Icons.local_mall_outlined,
          //   ),
          // ),
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
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                autofocus: false,
                onTap: () {
                  //   Navigator.of(context)
                  //       .pushReplacementNamed(SearchScreen.routeName);
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm, công thức',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.white,
                )),
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2))),
                      child: SizedBox(
                          height: 150.0,
                          width: double.infinity,
                          child: Carousel(
                            dotSpacing: 15.0,
                            dotSize: 6.0,
                            dotIncreasedColor: Colors.red,
                            dotBgColor: Colors.transparent,
                            indicatorBgPadding: 3.0,
                            dotPosition: DotPosition.bottomCenter,
                            dotHorizontalPadding: 5,
                            dotVerticalPadding: 5,
                            images: images
                                .map((item) => Container(
                                      child: Image.network(
                                        item,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                                .toList(),
                          )),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'MÓN HOT TRONG TUẦN',
                    //       style: TextStyle(
                    //           fontSize: 18, fontWeight: FontWeight.w400),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: 405,
                    //   width: double.infinity,
                    //   decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(10))),
                    //   child: ProductGrid(),
                    // ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(left: 10, right: 10, top: 3),
                    //   child: Container(
                    //       width: 400.0,
                    //       height: 45.0,
                    //       child: OutlinedButton(
                    //           style: OutlinedButton.styleFrom(
                    //             primary: Colors.blue,
                    //             side: const BorderSide(color: Colors.blue),
                    //           ),
                    //           child: const Text('Xem thêm'),
                    //           onPressed: () => {
                    //                 // Navigator.pushReplacementNamed(context,
                    //                 //     Product_detail_page.routeName),
                    //               },
                    //           onLongPress: () => {})),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'DỄ NẤU, TIẾT KIỆM THỜI GIAN',
                    //       style: TextStyle(
                    //           fontSize: 18, fontWeight: FontWeight.w400),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: 430,
                    //   width: double.infinity,
                    //   decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(10))),
                    //   child: ProductGrid(),
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'DỄ NẤU, TIẾT KIỆM THỜI GIAN',
                    //       style: TextStyle(
                    //           fontSize: 18, fontWeight: FontWeight.w400),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: 430,
                    //   width: double.infinity,
                    //   decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(10))),
                    //   child: ProductGrid(),
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giảm giá',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              // color: Colors.grey.shade500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Xem tất cả",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 274,
                      child: ListViewCart(2),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Món Hot Trong Tuần',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              // color: Colors.grey.shade500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Xem tất cả",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 274,
                      child: ListViewCart(1),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Món Dễ Chế Biến',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              // color: Colors.grey.shade500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Xem tất cả",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 274,
                      child: ListViewCart(3),
                    ),
                    // Container(
                    //   height: 274,
                    //   child: ListView.builder(
                    //     itemCount: popularItems.length,
                    //     scrollDirection: Axis.horizontal,
                    //     // padding: EdgeInsets.only(left: 16),
                    //     shrinkWrap: true,
                    //     physics: BouncingScrollPhysics(),
                    //     itemBuilder: (context, index) {
                    //       return PopularItemsCard(
                    //           popularItems: popularItems[index]);
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavbar(
                home: true,
              )),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = const HomeScreen();
      //                   currentTab = 0;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.water_damage_sharp,
      //                     color: currentTab == 0 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'Trang chủ',
      //                     style: TextStyle(
      //                       color: currentTab == 0 ? Colors.black : Colors.grey,
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = const OrderScreen();
      //                   currentTab = 1;
      //                 });
      //                 Navigator.pushReplacementNamed(
      //                     context, OrderScreen.routeName);
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.local_mall_outlined,
      //                     color: currentTab == 1 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'Đơn hàng',
      //                     style: TextStyle(
      //                       color: currentTab == 1 ? Colors.black : Colors.grey,
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   // currentScreen = const Profile();
      //                   // currentTab = 2;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: const [
      //                   Icon(
      //                     Icons.circle_notifications_rounded,
      //                     // color: currentTab == 2 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'Thông báo',
      //                     style: TextStyle(
      //                         // color: currentTab == 2 ? Colors.black : Colors.grey,
      //                         ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   // currentScreen = const Setting();
      //                   // currentTab = 3;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: const [
      //                   Icon(
      //                     Icons.perm_identity_outlined,
      //                     // color: currentTab == 3 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'Tài khoản',
      //                     style: TextStyle(
      //                         // color: currentTab == 3 ? Colors.black : Colors.grey,
      //                         ),
      //                   )
      //                 ],
      //               ),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
