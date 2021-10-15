import 'package:cookbookapp/Views/Pages/Store/store_employee.dart';
import 'package:cookbookapp/Views/Pages/Store/store_manage_order.dart';
import 'package:cookbookapp/Views/Pages/Store/store_manage_storage.dart';
import 'package:cookbookapp/Views/Pages/Store/store_menu.dart';
import 'package:cookbookapp/Views/Pages/Store/store_order_detail.dart';
import 'package:cookbookapp/Views/Pages/user/product_detail.dart';
import 'package:cookbookapp/Views/common/constants.dart';
import 'package:cookbookapp/model/dish.dart';
import 'package:cookbookapp/model/ingredient.dart';
import 'package:cookbookapp/model/order.dart';
import 'package:cookbookapp/model/recipeStep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreHomePage extends StatefulWidget {
  @override
  _StoreHomePageState createState() => _StoreHomePageState();
  static const routerName = '/storehomepage';
}

class _StoreHomePageState extends State<StoreHomePage> {
  int countNotDoneOrder = 0;
  List orderList1 = [];

  void initState() {
    List<Ingredient> listIng = [
      Ingredient(id: 1, name: 'ớt', value: 30),
      Ingredient(id: 2, name: 'gà', value: 1500),
      Ingredient(id: 3, name: 'muối', value: 200),
      Ingredient(id: 4, name: 'lá chanh', value: 50),
      Ingredient(id: 4, name: 'lá tiêu', value: 30),
    ];
    List<RecipeStep> recipe = [
      RecipeStep(
          id: '1',
          picture:
              'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
          desc:
              'bạn trộn nước xốt ướp gà theo công thức: 2 muỗng canh nước mắm, 1 muỗng cà phê muối, 2 muỗng canh dầu ăn, 2 muỗng cà phê đường, 1 muỗng cà phê bột ngọt, 1/2 muỗng cà phê tiêu, 4 trái ớt giã nhuyễn, khuấy đều.'),
      RecipeStep(
          id: '2',
          picture:
              'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
          desc:
              'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
      RecipeStep(
          id: '1',
          picture:
              'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
          desc: 'Trình Bày Và Thưởng Thức'),
    ];
    Dish dish = Dish(
        id: '1',
        name: 'Gà Nướng',
        price: 200,
        category: 'Gà',
        image: '',
        des: 'ngon lam',
        numOfPer: 4,
        nutrient: 'sss',
        status: true,
        parentID: 'id',
        rating: 5,
        recipe: [
          RecipeStep(
              id: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              desc:
                  'bạn trộn nước xốt ướp gà theo công thức: 2 muỗng canh nước mắm, 1 muỗng cà phê muối, 2 muỗng canh dầu ăn, 2 muỗng cà phê đường, 1 muỗng cà phê bột ngọt, 1/2 muỗng cà phê tiêu, 4 trái ớt giã nhuyễn, khuấy đều.'),
          RecipeStep(
              id: '2',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
              desc:
                  'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
          RecipeStep(
              id: '1',
              picture:
                  'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
              desc: 'Trình Bày Và Thưởng Thức'),
        ],
        listIng: [
          Ingredient(id: 1, name: 'ớt', value: 30),
          Ingredient(id: 2, name: 'gà', value: 1500),
          Ingredient(id: 3, name: 'muối', value: 200),
          Ingredient(id: 4, name: 'lá chanh', value: 50),
          Ingredient(id: 4, name: 'lá tiêu', value: 30),
        ]
        //
        );

    Order order1 = Order(
      storeId: '1',
      userId: '1',
      orderId: '006',
      time: DateTime.parse("2021-10-06 08:41:21"),
      address: 'Gà nướng muối',
      price: 3270000,
      payment: 'Canh bí đỏ',
      userName: '2',
      orderStatus: 1,
      listDish: [
        Dish(
            id: '1',
            name: 'Gà Nướng',
            price: 200,
            category: 'Gà',
            image: '',
            des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
            numOfPer: 4,
            nutrient: '1200',
            status: true,
            parentID: '1',
            rating: 5,
            recipe: [
              RecipeStep(
                  id: '1',
                  picture:
                      'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
                  desc: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
              RecipeStep(
                  id: '2',
                  picture:
                      'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
                  desc:
                      'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
              RecipeStep(
                  id: '1',
                  picture:
                      'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
                  desc: 'Trình Bày Và Thưởng Thức'),
            ],
            listIng: [
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
            ]
            //
            ),
        Dish(
            id: '2',
            name: 'Canh bí đỏ',
            price: 170,
            category: 'Canh',
            image: '',
            des:
                'Canh bí đỏ thịt bằm không chỉ là món ngon dễ làm mà còn bổ dưỡng, tốt cho mắt. Cách nấu canh bí đỏ thịt bằm đơn giản có bí chín mềm, bùi bùi, thịt băm béo béo, nước canh bí ngọt thị tự nhiên, rất hấp dẫn.',
            numOfPer: 4,
            nutrient: '1600',
            status: true,
            parentID: '2',
            rating: 4,
            recipe: [
              RecipeStep(
                  id: '10',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step1-636352841728994665.jpg',
                  desc:
                      'Phi thơm 20gr đầu hành băm nhuyễn cùng với 1 muỗng canh dầu ăn, cho 200gr thịt băm vào, nêm 1 muỗng canh đường, 1 muỗng canh hạt nêm, 1 muỗng canh nước mắm và 1 muỗng cà phê tiêu.'),
              RecipeStep(
                  id: '11',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step2-636352841812922812.jpg',
                  desc:
                      'Xào cho thịt băm vừa chín thì thêm vào 1 lít nước, khuấy đều. Tiếp theo cho thêm bí đỏ cắt lát, đậy nắp, mở lửa to. Nấu canh bí đỏ thịt bằm trong khoảng 15 phút cho bí chín mềm.'),
              RecipeStep(
                  id: '12',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step3-636352841923371006.jpg',
                  desc:
                      'au khi canh bí đỏ thịt bằm được hầm mềm, mở nắp nêm 1 muỗng canh hạt nêm, thêm hành cần cắt nhỏ vào khuấy đều, tắt bếp.'),
              RecipeStep(
                  id: '13',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step4-636353090726251106.jpg',
                  desc:
                      'Cách nấu canh bí đỏ thịt bằm "dễ ợt" đúng không. Canh bí đỏ thịt bằm với hương vị đậm đà, đơn giản, dễ nấu và chứa rất nhiều chất dinh dưỡng tốt cho cơ thể. Đồng thời bí đỏ còn tốt cho trí não nữa đấy, những ngày nào quá bận rộn thì hãy chuẩn bị cho mình một chén canh bí đỏ để tẩm bổ nhé. Cách nấu canh bí đỏ thịt bằm quá đơn giản và nhanh gọn đúng không, cùng mình làm cho gia đình thưởng thức nhé!!'),
            ],
            listIng: [
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );

    Order order3 = Order(
      storeId: '1',
      userId: '1',
      orderId: '008',
      time: DateTime.parse("2021-10-06 09:35:50"),
      address: 'Lẩu thái',
      price: 210000,
      payment: 'Ba rọi chiên',
      userName: '2',
      orderStatus: 1,
      listDish: [
        Dish(
            id: '1',
            name: 'Gà Nướng',
            price: 200,
            category: 'Gà',
            image: '',
            des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
            numOfPer: 4,
            nutrient: '1200',
            status: true,
            parentID: '1',
            rating: 5,
            recipe: [
              RecipeStep(
                  id: '1',
                  picture:
                      'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
                  desc: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
              RecipeStep(
                  id: '2',
                  picture:
                      'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
                  desc:
                      'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
              RecipeStep(
                  id: '1',
                  picture:
                      'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
                  desc: 'Trình Bày Và Thưởng Thức'),
            ],
            listIng: [
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
            ]
            //
            ),
        Dish(
            id: '2',
            name: 'Canh bí đỏ',
            price: 170,
            category: 'Canh',
            image: '',
            des:
                'Canh bí đỏ thịt bằm không chỉ là món ngon dễ làm mà còn bổ dưỡng, tốt cho mắt. Cách nấu canh bí đỏ thịt bằm đơn giản có bí chín mềm, bùi bùi, thịt băm béo béo, nước canh bí ngọt thị tự nhiên, rất hấp dẫn.',
            numOfPer: 4,
            nutrient: '1600',
            status: true,
            parentID: '2',
            rating: 4,
            recipe: [
              RecipeStep(
                  id: '10',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step1-636352841728994665.jpg',
                  desc:
                      'Phi thơm 20gr đầu hành băm nhuyễn cùng với 1 muỗng canh dầu ăn, cho 200gr thịt băm vào, nêm 1 muỗng canh đường, 1 muỗng canh hạt nêm, 1 muỗng canh nước mắm và 1 muỗng cà phê tiêu.'),
              RecipeStep(
                  id: '11',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step2-636352841812922812.jpg',
                  desc:
                      'Xào cho thịt băm vừa chín thì thêm vào 1 lít nước, khuấy đều. Tiếp theo cho thêm bí đỏ cắt lát, đậy nắp, mở lửa to. Nấu canh bí đỏ thịt bằm trong khoảng 15 phút cho bí chín mềm.'),
              RecipeStep(
                  id: '12',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step3-636352841923371006.jpg',
                  desc:
                      'au khi canh bí đỏ thịt bằm được hầm mềm, mở nắp nêm 1 muỗng canh hạt nêm, thêm hành cần cắt nhỏ vào khuấy đều, tắt bếp.'),
              RecipeStep(
                  id: '13',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step4-636353090726251106.jpg',
                  desc:
                      'Cách nấu canh bí đỏ thịt bằm "dễ ợt" đúng không. Canh bí đỏ thịt bằm với hương vị đậm đà, đơn giản, dễ nấu và chứa rất nhiều chất dinh dưỡng tốt cho cơ thể. Đồng thời bí đỏ còn tốt cho trí não nữa đấy, những ngày nào quá bận rộn thì hãy chuẩn bị cho mình một chén canh bí đỏ để tẩm bổ nhé. Cách nấu canh bí đỏ thịt bằm quá đơn giản và nhanh gọn đúng không, cùng mình làm cho gia đình thưởng thức nhé!!'),
            ],
            listIng: [
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );

    Order order2 = Order(
      storeId: '1',
      userId: '1',
      orderId: '007',
      time: DateTime.parse("2021-10-06 08:50:50"),
      address: 'Canh bí đỏ',
      price: 470000,
      payment: 'thịt kho tiêu',
      userName: '2',
      orderStatus: 1,
      listDish: [
        Dish(
            id: '1',
            name: 'Gà Nướng',
            price: 200,
            category: 'Gà',
            image: '',
            des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
            numOfPer: 4,
            nutrient: '1200',
            status: true,
            parentID: '1',
            rating: 5,
            recipe: [
              RecipeStep(
                  id: '1',
                  picture:
                      'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
                  desc: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
              RecipeStep(
                  id: '2',
                  picture:
                      'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
                  desc:
                      'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
              RecipeStep(
                  id: '1',
                  picture:
                      'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
                  desc: 'Trình Bày Và Thưởng Thức'),
            ],
            listIng: [
              Ingredient(id: 1, name: 'ớt', value: 30),
              Ingredient(id: 2, name: 'gà', value: 1500),
              Ingredient(id: 3, name: 'muối', value: 200),
              Ingredient(id: 4, name: 'lá chanh', value: 50),
              Ingredient(id: 4, name: 'lá tiêu', value: 30),
            ]
            //
            ),
        Dish(
            id: '2',
            name: 'Canh bí đỏ',
            price: 170,
            category: 'Canh',
            image: '',
            des:
                'Canh bí đỏ thịt bằm không chỉ là món ngon dễ làm mà còn bổ dưỡng, tốt cho mắt. Cách nấu canh bí đỏ thịt bằm đơn giản có bí chín mềm, bùi bùi, thịt băm béo béo, nước canh bí ngọt thị tự nhiên, rất hấp dẫn.',
            numOfPer: 4,
            nutrient: '1600',
            status: true,
            parentID: '2',
            rating: 4,
            recipe: [
              RecipeStep(
                  id: '10',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step1-636352841728994665.jpg',
                  desc:
                      'Phi thơm 20gr đầu hành băm nhuyễn cùng với 1 muỗng canh dầu ăn, cho 200gr thịt băm vào, nêm 1 muỗng canh đường, 1 muỗng canh hạt nêm, 1 muỗng canh nước mắm và 1 muỗng cà phê tiêu.'),
              RecipeStep(
                  id: '11',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step2-636352841812922812.jpg',
                  desc:
                      'Xào cho thịt băm vừa chín thì thêm vào 1 lít nước, khuấy đều. Tiếp theo cho thêm bí đỏ cắt lát, đậy nắp, mở lửa to. Nấu canh bí đỏ thịt bằm trong khoảng 15 phút cho bí chín mềm.'),
              RecipeStep(
                  id: '12',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step3-636352841923371006.jpg',
                  desc:
                      'au khi canh bí đỏ thịt bằm được hầm mềm, mở nắp nêm 1 muỗng canh hạt nêm, thêm hành cần cắt nhỏ vào khuấy đều, tắt bếp.'),
              RecipeStep(
                  id: '13',
                  picture:
                      'https://image.cooky.vn/recipe/g3/20486/s640/recipe20486-prepare-step4-636353090726251106.jpg',
                  desc:
                      'Cách nấu canh bí đỏ thịt bằm "dễ ợt" đúng không. Canh bí đỏ thịt bằm với hương vị đậm đà, đơn giản, dễ nấu và chứa rất nhiều chất dinh dưỡng tốt cho cơ thể. Đồng thời bí đỏ còn tốt cho trí não nữa đấy, những ngày nào quá bận rộn thì hãy chuẩn bị cho mình một chén canh bí đỏ để tẩm bổ nhé. Cách nấu canh bí đỏ thịt bằm quá đơn giản và nhanh gọn đúng không, cùng mình làm cho gia đình thưởng thức nhé!!'),
            ],
            listIng: [
              Ingredient(id: 10, name: 'Bí đỏ', value: 500),
              Ingredient(id: 11, name: 'Thịt băm', value: 200),
              Ingredient(id: 13, name: 'Hành lá', value: 30),
              Ingredient(id: 14, name: 'Cần tàu', value: 10),
              Ingredient(id: 15, name: 'Đường trắng', value: 15),
              Ingredient(id: 16, name: 'Hạt nêm', value: 30),
              Ingredient(id: 17, name: 'Nước mắm', value: 15),
              Ingredient(id: 18, name: 'Tiêu', value: 5),
              Ingredient(id: 19, name: 'Dầu ăn', value: 15),
            ]
            //
            )
      ],
    );

    orderList1.add(order1);
    orderList1.add(order2);
    orderList1.add(order3);
    // orderList1.add(order4);
  }

  List orderList = [
    {
      'name': 'Trần Bá Sơn',
      'address': '216 Tân Kỳ Tân Quý, Tân Phú',
      'price': '420000',
      'time': '${DateTime.now().toString()}',
      'orderCode': '001'
    },
    {
      'name': 'Hồ Cẩm Đào',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '002'
    },
    {
      'name': 'Hồ Cẩm Đào',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '130000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '003'
    },
    {
      'name': 'Hồ Cẩm Đào',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '004'
    },
    {
      'name': 'Hồ Cẩm Đào',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '005'
    },
    {
      'name': 'Hồ Cẩm Đào',
      'address': '14/9/38 Tân Kỳ Tân Quý, Tân Phú',
      'price': '120000',
      'time': '2021-09-23 08:41:21',
      'orderCode': '006'
    }
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Bếp CookBox'),
      ),
      drawer: new Drawer(
        child: ListView(children: <Widget>[
          // Text('Đăng xuất'),
          _buildDrawerItem(
              context, 'Thông tin cá nhân', Icons.info, Colors.transparent),
          new Divider(height: 20.0),
          _buildDrawerItem(
              context, 'Đăng Xuất', Icons.logout, Colors.transparent),
          new Divider(height: 20.0),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'trang chính',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Thông báo',
            backgroundColor: Colors.red,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.all_inbox_rounded),
          //   label: 'Kho',
          //   backgroundColor: Colors.green,
          // ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.red.withOpacity(1),
            //       borderRadius: BorderRadius.circular(10)),
            //   margin: EdgeInsets.only(left: 0, right: 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       // SvgPicture.asset('assets/icons/menu.svg'),
            //       Container(
            //           height: 59,
            //           width: 59,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             image: DecorationImage(
            //               image: AssetImage('assets/images/chefLogo.jpg'),
            //             ),
            //           ))
            //     ],
            //   ),
            // ),
            //infor
            Container(
              decoration: BoxDecoration(
                  // color: Colors.red.withOpacity(1),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/chefLogo.jpg'),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "CookBox chi nhánh 6",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                  Text(
                    "276 Tây Thạnh, Tân Phú, TP Hồ Chí Minh",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
//banner
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30),
            //       image: DecorationImage(
            //           image: AssetImage('assets/images/bannerStore.jpg'))),
            //   height: 210,
            //   width: 30,
            // ),

            //category
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.red.withOpacity(1),
            //   ),
            //   padding: EdgeInsets.all(10),
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         InkWell(
            //           onTap: () => {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => StoreManageOrder()),
            //             )
            //           },
            //           child: Container(
            //             padding: EdgeInsets.only(right: 10),
            //             child: Stack(
            //               children: [
            //                 Positioned(
            //                   child: Container(
            //                     width: 170,
            //                     height: 170,
            //                     // color: Colors.red.withOpacity(0.7),
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(30),
            //                         image: DecorationImage(
            //                             image: AssetImage(
            //                                 'assets/images/cooking_list.jpg'))),
            //                   ),
            //                 ),
            //                 Positioned(
            //                     top: 120,
            //                     left: 38,
            //                     child: Text(
            //                       'Đơn hàng',
            //                       style: TextStyle(fontSize: 18),
            //                     )),
            //               ],
            //             ),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () => {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => StoreManageStore()),
            //             )
            //           },
            //           child: Container(
            //             padding: EdgeInsets.only(right: 10),
            //             child: Stack(
            //               children: [
            //                 Positioned(
            //                   child: Container(
            //                     width: 170,
            //                     height: 170,
            //                     // color: Colors.red.withOpacity(0.7),
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(30),
            //                         image: DecorationImage(
            //                             image: AssetImage(
            //                                 'assets/images/storageLogo.jpg'))),
            //                   ),
            //                 ),
            //                 Positioned(
            //                     top: 120,
            //                     left: 11,
            //                     child: Text(
            //                       'Kho Nguyên Liệu',
            //                       style: TextStyle(fontSize: 18),
            //                     )),
            //               ],
            //             ),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () => {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => StoreMenu()),
            //             )
            //           },
            //           child: Container(
            //             padding: EdgeInsets.only(right: 10),
            //             child: Stack(
            //               children: [
            //                 Positioned(
            //                   child: Container(
            //                     width: 170,
            //                     height: 170,
            //                     // color: Colors.red.withOpacity(0.7),
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(30),
            //                         image: DecorationImage(
            //                             image: AssetImage(
            //                                 'assets/images/menuDish.jpg'))),
            //                   ),
            //                 ),
            //                 Positioned(
            //                     top: 120,
            //                     left: 50,
            //                     child: Text(
            //                       'Thực đơn',
            //                       style: TextStyle(fontSize: 18),
            //                     )),
            //               ],
            //             ),
            //           ),
            //         ),
            //          InkWell(
            //           onTap: () => {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => StoreEmp()),
            //             )
            //           },
            //           child: Container(
            //             padding: EdgeInsets.only(right: 10),
            //             child: Stack(
            //               children: [
            //                 Positioned(
            //                   child: Container(
            //                     width: 170,
            //                     height: 170,
            //                     // color: Colors.red.withOpacity(0.7),
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(30),
            //                         image: DecorationImage(
            //                             image: AssetImage(
            //                                 'assets/images/emp1.jpg'))),
            //                   ),
            //                 ),
            //                 Positioned(
            //                     top: 120,
            //                     left: 50,
            //                     child: Text(
            //                       'Nhân Sự',
            //                       style: TextStyle(fontSize: 18),
            //                     )),
            //               ],
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            Text(
              'Đơn Mới',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            //listNewOrder    ,
            Container(
              height: 400,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: orderList1.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (orderList1[index].orderStatus == 1) {
                    countNotDoneOrder++;
                    return Order_item(
                      name: orderList1[index].userName,
                      price: orderList1[index].price,
                      address: orderList1[index].address,
                      orderCode: orderList1[index].orderId,
                      time: orderList1[index].time,
                      status: orderList1[index].orderStatus,
                      payment: orderList1[index].payment,
                    );
                  }
                  return Container();
                },
              ),
            ),
            // countNotDoneOrder == 0
            //     ? Container(
            //         child: Text('Không có đơn nào mới'),
            //       )
            //     : Text(''),
          ],
        ),
      ),
    );
  }
}

class Order_item extends StatelessWidget {
  final String name;
  final String address;
  final double price;
  final DateTime time;
  final String orderCode;
  final int status;
  final String payment;

  const Order_item(
      {Key? key,
      required this.name,
      required this.address,
      required this.price,
      required this.time,
      required this.orderCode,
      required this.payment,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == 1) {
      return Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.horizontal(),
          border: Border.all(color: Colors.black.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StoreOderDetail()),
              );
            },
            child: Column(
              children: [
                Container(
                  height: 80,
                  margin: EdgeInsets.only(bottom: 0, top: 0),
                  // padding:
                  //     EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.8),
                    // borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.2),
                    //     // spreadRadius: 5,
                    //     // blurRadius: 7,
                    //     offset: Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        height: 70,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                left: 5,
                                child: Text(
                                  "Mã đơn hàng: $orderCode",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,color: Colors.white),
                                )),
                            Positioned(
                              top: 50,
                              left: 5,
                              child: Text("Số lượng món: ${name}",
                                  style: TextStyle(fontSize: 14,color: Colors.white)),
                            ),
                            Positioned(
                                top: 30,
                                left: 5,
                                child: Text(
                                  "$time",
                                  style: TextStyle(fontSize: 14,color: Colors.white),
                                )),
                            // Positioned(
                            //     top: 33,
                            //     left: 5,
                            //     child: Text(
                            //       "$address",
                            //       style: TextStyle(fontSize: 12),
                            //     )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Colors.red.withOpacity(0.5),
                        ),
                        width: 130,
                        height: 70,
                        child: Container(
                            padding: EdgeInsets.only(left: 25, top: 25),
                            child: Text(
                              'View detail',
                              style: TextStyle(fontSize: 18,color: Colors.black),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    // color: Colors.grey.withOpacity(0.2),
                  ),
                  height: 90,
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(top: 10),
                          margin: EdgeInsetsDirectional.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1, ${address}',
                                style: TextStyle(fontSize: 19),
                              ),
                              Text('Số lượng: 1')
                            ],
                          )),
                      Container(
                          margin: EdgeInsetsDirectional.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '2, ${payment}',
                                style: TextStyle(fontSize: 19),
                              ),
                              Text('Số lượng: 1')
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )),
      );
    }
    return Text('');
  }
}

Widget _buildDrawerItem(
    BuildContext context, String drawerItem, IconData iconData, Color color) {
  return Container(
    color: color,
    child: new Padding(
      padding: new EdgeInsets.all(7.0),
      child: new Row(
        children: <Widget>[
          new Icon(iconData),
          new Container(
            margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: new Text(
              drawerItem.toString(),
              // style: styleDrawerItem,
            ),
          ),
        ],
      ),
    ),
  );
}
