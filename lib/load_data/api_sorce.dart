
import 'load_data.dart';

class ApiSource {
  static ApiSource instace = ApiSource();

  Future<Map<String, dynamic>> getCategories() {
    return LoadData.get("categories.php");
  }

  Future<Map<String, dynamic>> getMeals(String category) {
    return LoadData.get("filter.php?c=$category");
  }

  Future<Map<String, dynamic>> getMealsDetail(String idMeal) {
    return LoadData.get("lookup.php?i=$idMeal");
  }
}
