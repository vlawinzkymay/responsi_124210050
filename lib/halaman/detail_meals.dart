
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api_model/model.dart';
import '../load_data/api_sorce.dart';
import '../load_data/load_data.dart';


class ApiSource {
  static ApiSource instance = ApiSource();

  Future<Map<String, dynamic>> getMealsDetail(String idMeal) {
    return LoadData.get("lookup.php?i=$idMeal");
  }
}

class DetailMeals extends StatelessWidget {
  final String idMeal;
  const DetailMeals({super.key, required this.idMeal});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Detail"),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.pink[200],
      body: FutureBuilder(
        future: ApiSource.instance.getMealsDetail(idMeal),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            DetailMealsModel detailMeal =
            DetailMealsModel.fromJson(snapshot.data!);
            return _buildDetailMeal(detailMeal);
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error Loading Data'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildDetailMeal(DetailMealsModel detailMeal) {
    return ListView.builder(
      itemCount: detailMeal.meals!.length,
      itemBuilder: (context, index) {
        var item = detailMeal.meals![index];
        return Column(
          children: [
            Image.network(item.strMealThumb!),
            const SizedBox(
              height: 10,
            ),
            //title
            Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              item.strMeal!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Category : ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.strCategory!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Area : ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.strArea!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                )),

            //ingredients
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ingredients",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.strIngredient1!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient2!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient3!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient4!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient5!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient6!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient7!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient8!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient9!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient10!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient11!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient12!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient13!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient14!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient15!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient16!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient17!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient18!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient19!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item.strIngredient20!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //instructions
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Instructions",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        item.strInstructions!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse(item.strYoutube!));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink[200],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Watch Tutorial",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
