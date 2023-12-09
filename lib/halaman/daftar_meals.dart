import 'package:flutter/material.dart';
import 'package:responsi_may_vlawinzky/api_model/model.dart';
import '../load_data/api_sorce.dart';
import '../load_data/load_data.dart';
import 'categories.dart';
import 'detail_meals.dart';


class ApiSource {
  static ApiSource instance = ApiSource();

  Future<Map<String, dynamic>> getMeals( String category) {
    return LoadData.get("filter.php?c=$category");
  }
}

class ListMeals extends StatelessWidget {
  const ListMeals({super.key, required this.Category});

  final String Category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Category),
        backgroundColor: Colors.pink[200],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiSource.instance.getMeals(Category),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.hasData) {
            Filter meal = Filter.fromJson(snapshot.data!);
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: meal.meals?.length,
                itemBuilder: (context, int index) {
                  final FilterMeals? meals = meal.meals?[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailMeals(idMeal: '${meals?.idMeal}')));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Image.network(
                                '${meals?.strMealThumb}',
                                height: 160,
                                width: 150,
                              ),
                            ),
                            Text(
                              '${meals?.strMeal}',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.pink[200]),
          );
        },
      ),
    );
  }
}
