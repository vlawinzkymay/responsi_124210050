import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api_model/model.dart';
import '../load_data/load_data.dart';
import 'daftar_meals.dart';

class ApiSource {
  static ApiSource instance = ApiSource();

  Future<Map<String, dynamic>> getCategories() {
    return LoadData.get("categories.php");
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories Meals'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ApiSource.instance.getCategories(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.hasData) {
            Meals category = Meals.fromJson(snapshot.data!);
            return ListView.builder(
                itemCount: category.categories?.length,
                itemBuilder: (BuildContext context, int index) {
                  var categories = category.categories?[index];
                  return InkWell(
                    onTap: () =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ListMeals(Category: '${categories?.strCategory}'),
                          ),
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            children: [
                              Image.network(
                                '${categories?.strCategoryThumb}',
                                height: 120,
                                width: 120,
                              ),
                              Text(
                                '${categories?.strCategory}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0),
                                child: Text(
                                  '${categories?.strCategoryDescription}',
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.deepOrange[900]),
          );
        },
      ),
    );
  }
}