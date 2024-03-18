import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_web/shared/components/components.dart';
import 'package:flutter_web/tadrebk%20home%20Website/model/training_model.dart';
import 'package:flutter_web/tadrebk%20home%20Website/screen/responsive.dart';
import 'package:flutter_web/tadrebk%20home%20Website/trinning_home/detail_training_screen.dart';

class TrinningHome extends StatefulWidget {
  const TrinningHome({Key? key}) : super(key: key);

  @override
  _TrinningHomeState createState() => _TrinningHomeState();
}

class _TrinningHomeState extends State<TrinningHome> {
  TextEditingController _searchController = TextEditingController();
  List<Training> filteredTrainings = [];

  @override
  void initState() {
    super.initState();
    filteredTrainings = trainings; // عرض جميع التدريبات
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Center(
            child: const Text(
              'All Training for Tadrebk',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: TrainingSearchDelegate(filteredTrainings),
                ).then((selectedTraining) {
                  if (selectedTraining != null) {
                    navigateToTrainingDetail(selectedTraining);
                  }
                });
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30), // إضافة مسافة بين الشريط العلوي وحقل البحث
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: defaultFormField(
                controller: _searchController,
                type: TextInputType.text,
                label: 'Search Training',
                labelColor: Colors.amber,
                prefix: Icons.search,
                validate: (value) {},
                onChanged: (value) {
                  filterTrainings(value);
                },
              ),
            ),
            SizedBox(height: 15), // إضافة مسافة بين الشريط العلوي وحقل البحث
            Divider(height: 16, color: Colors.transparent), // إضافة مسافة بين حقل البحث وعرض التدريبات
            Responsive(
              mobile: buildGridView(context, 1),
              desktop: buildGridView(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridView(BuildContext context, int crossAxisCount) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: filteredTrainings.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToTrainingDetail(filteredTrainings[index]);
          },
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    filteredTrainings[index].image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filteredTrainings[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        filteredTrainings[index].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: filteredTrainings[index].rating,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '\$${filteredTrainings[index].price}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void navigateToTrainingDetail(Training training) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingDetailScreen(training: training),
      ),
    );
  }

  void filterTrainings(String query) {
    setState(() {
      filteredTrainings = trainings.where((training) {
        return training.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }
}

class TrainingSearchDelegate extends SearchDelegate<Training?> {
  final List<Training> trainings;

  TrainingSearchDelegate(this.trainings);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: ()
        {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // يتم عرض النتائج هنا بناءً على query
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Training> suggestionList = query.isEmpty
        ? trainings // عرض جميع التدريبات إذا كانت query فارغة
        : trainings.where((Training training) {
      // تصفية التدريبات حسب query
      return training.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final Training training = suggestionList[index];
        return ListTile(
          title: Text(training.title),
          onTap: () {
            close(context, training);
          },
        );
      },
    );
  }
}
