import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_web/shared/components/components.dart';
import 'package:flutter_web/tadrebk%20home%20Website/model/training_model.dart';
import 'package:flutter_web/tadrebk%20home%20Website/trinning_home/detail_training_screen.dart';
import 'package:flutter_web/tadrebk%20home%20Website/trinning_home/trinng_home.dart';
import 'package:lottie/lottie.dart';

class HeaderContaion extends StatefulWidget {
  const HeaderContaion({Key? key});

  @override
  State<HeaderContaion> createState() => _HeaderContaionState();
}

class _HeaderContaionState extends State<HeaderContaion> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: HeaderBody(trainings: trainings),
            ),
            Expanded(
              flex: 2,
              child: Lottie.network(
                "assets/images/AnimationHome.json",
                height: 300,
                width: 350,
              ),
            ),
          ],
        )
      ],
    );
  }
}

// for mobile
class MobileHeaderContain extends StatelessWidget {
  const MobileHeaderContain({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.network(
          "assets/images/website-Mobile.json",
          height: 300,
          width: 350,
        ),
        HeaderBody(trainings: trainings),
      ],
    );
  }
}

class HeaderBody extends StatelessWidget {
  final List<Training> trainings;

  const HeaderBody({Key? key, required this.trainings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AutoSizeText(
          "Training Now",
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 53),
        ),
        const SizedBox(
          height: 10,
        ),
        const AutoSizeText(
          "Find out the best companies.",
          maxLines: 1,
          style: TextStyle(fontSize: 53),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Discover and get the training you need in different fields. Course details, communicate with trainers, and benefit from direct job opportunities after training. Join your coaching community now for amazing development and training opportunities.",
          selectionColor: Colors.deepOrange,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: "Search your favorite items",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.amberAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrinningHome(),
                ),
              );
            },
            child: const Text(
              "Training Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
