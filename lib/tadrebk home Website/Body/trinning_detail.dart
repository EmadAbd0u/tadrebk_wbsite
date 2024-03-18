import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/tadrebk%20home%20Website/model/training_model.dart';


class TrainingsDetail extends StatelessWidget
{
  final Training training;
  final VoidCallback press;

  const TrainingsDetail({super.key, required this.press, required this.training});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: InkWell(
        onTap: press,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  training.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              training.title,
              maxLines: 1,
              minFontSize: 14,
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
