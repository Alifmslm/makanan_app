
class Meal {
   String? idMeal;
   String? strMeal;
   String? strInstructions;
   String? strMealThumb;
   String? strCategory;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strInstructions,
    this.strMealThumb,
    this.strCategory,
  });

  factory Meal.fromJson(Map<String, dynamic> json) =>Meal(
    idMeal: json["idMeal"],
    strMeal: json["strMeal"],
    strInstructions: json["strInstructions"],
    strMealThumb: json["strMealThumb"],
    strCategory: json["strCategory"]
  );

  Map<String, dynamic> toJson() => {
    "idMeal": idMeal,
    "strMeal": strMeal,
    "strInstructions": strInstructions,
    "strMealThumb": strMealThumb,
    "strCategory": strCategory
  };

  void setFavouriteId(String id){
    this.idMeal = id;
  }

}