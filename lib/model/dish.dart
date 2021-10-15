import 'package:cookbookapp/model/ingredient.dart';
import 'package:cookbookapp/model/recipeStep.dart';

class Dish {
  String id;
  String name;
  double price;
  String image;
  String category;
  String des;
  int numOfPer;
  String nutrient;
  bool status;
  String parentID;
  List<RecipeStep> recipe;
  List<Ingredient> listIng;
  int rating;

  Dish(
      {required this.id,
      required this.name,
      required this.price,
      required this.category,
      required this.image,
      required this.des,
      required this.numOfPer,
      required this.nutrient,
      required this.status,
      required this.parentID,
      required this.recipe,
      required this.listIng,
      required this.rating});
}
