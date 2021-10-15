import 'package:cookbookapp/Views/Pages/Store/store_employee.dart';
import 'package:cookbookapp/Views/Pages/Store/store_home_page.dart';
import 'package:cookbookapp/Views/Pages/Store/store_manage_order.dart';
import 'package:cookbookapp/Views/Pages/Store/store_manage_storage.dart';
import 'package:cookbookapp/Views/Pages/Store/store_material.dart';
import 'package:cookbookapp/Views/Pages/Store/store_menu.dart';
import 'package:cookbookapp/Views/Pages/Store/store_order_detail.dart';
import 'package:cookbookapp/Views/Pages/user/product_detail.dart';
import 'package:cookbookapp/screens/detail_order.dart';

// import 'package:cookbookapp/Views/Pages/user/detailitem.dart';
// import 'package:cookbookapp/Views/Pages/user/homescreen.dart';
// import 'package:cookbookapp/Views/Pages/user/listitembasecat.dart';
// import 'package:cookbookapp/Views/Pages/user/loginscreen.dart';
import 'package:cookbookapp/screens/home_screen.dart';
import 'package:cookbookapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'providers/cart.dart';
import 'providers/orders.dart';
import 'providers/products.dart';
import 'screens/account_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/notify_screen.dart';
import 'screens/order/order.dart';
import 'screens/payment_screen.dart';
import 'screens/product_detail.dart';
import 'screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Products()),
          ChangeNotifierProvider(create: (ctx) => Cart()),
          ChangeNotifierProvider(create: (ctx) => Orders()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Roboto'),
          // home: LoginScreen(),
          // home: HomeScreen(),
           home: StoreHomePage(),


          // home: StoreManageStore(),

          // home: StoreManageOrder(),
          // home:StoreOderDetail() ,
          // home :Product_detail_page(),
          // home: HomeScreen(),

          // home: DetailOrder(),
          // home: StoreMenu(), 
          //  home: StoreManageMaterial(),
          // home: StoreEmp(),
          debugShowCheckedModeBanner: false,
          routes: {
            // LoginScreen.routeName: (context) => LoginScreen(),
            // HomeScreen.routeName: (context) => const HomeScreen(),
            // ListItemByCat.routeName: (context) => const ListItemByCat(),
            // DetailItem.routeName: (context) => const DetailItem(),
            Product_detail_page.routeName: (context) =>
                const Product_detail_page(),
            StoreHomePage.routerName: (context) => StoreHomePage(),
            StoreOderDetail.routeName: (context) => StoreOderDetail(),
            StoreManageOrder.routeName: (context) => StoreManageOrder(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignUpScreen.routeName: (ctx) => const SignUpScreen(),
            SearchScreen.routeName: (ctcx) => const SearchScreen(),
            CartScreen.routeName: (ctcx) => CartScreen(),
            // OrderScreen.routeName: (ctcx) => OrderScreen(),
            Order.routeName: (ctcx) => Order(),
            NotifyScreen.routeName: (ctcx) => NotifyScreen(),
            AccountScreen.routeName: (ctcx) => AccountScreen(),
            ProductDetailScreen.routeName: (ctcx) => ProductDetailScreen(),
            PaymentScreen.routeName: (ctcx) => PaymentScreen(),
            DetailOrder.routeName: (ctcx) => DetailOrder(),
          },
        ));
  }
}
