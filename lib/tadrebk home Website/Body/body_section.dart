import 'package:flutter/material.dart';
import 'package:flutter_web/person/create_account/create_account.dart';
import 'package:flutter_web/shared/components/components.dart';
import 'package:flutter_web/tadrebk%20home%20Website/Body/trinning_detail.dart';
import 'package:flutter_web/tadrebk%20home%20Website/Body/send_feedBack.dart';
import 'package:flutter_web/tadrebk%20home%20Website/model/training_model.dart';
import 'package:flutter_web/tadrebk%20home%20Website/screen/responsive.dart';


class BodySection extends StatefulWidget {

  const BodySection({
    super.key,
  });

  @override
  State<BodySection> createState() => _BodySectionState();


}

class _BodySectionState extends State<BodySection> {




  @override
  Widget build(BuildContext context) {

    // يتم استخدام MediaQuery للحصول على حجم الشاشة
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1233),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 100),
              child: Center(child: Text("All Training Details",
                style: TextStyle(

                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black

                ),
              )),
            ),
            // يتم استخدام Responsive لتوفير تصميم مختلف لأحجام الشاشة المختلفة
            Responsive(
              // إذا كان حجم الشاشة أصغر من 690، فسيتم عرض 2 عنصر في الصف الواحد، وإلا سيتم عرض 3 عناصر
              mobile: trainingDetail(
                crossAxisCount: size.width < 690 ? 2 : 3,
                // إذا كان حجم الشاشة أصغر من 560، فسيتم تطبيق نسبة عرض إلى ارتفاع 0.85، وإلا سيتم تطبيق نسبة 1.1
                aspectRation: size.width < 560 ? 0.85 : 1.1,
              ),
              desktop: trainingDetail(
                // إذا كان حجم الشاشة أصغر من 650، فسيتم عرض 2 عنصر في الصف الواحد، وإلا سيتم عرض 3 عناصر
                crossAxisCount: size.width < 650 ? 2 : 3,
                // إذا كان حجم الشاشة أصغر من 650، فسيتم تطبيق نسبة عرض إلى ارتفاع 0.85، وإلا سيتم تطبيق نسبة 1.1
                aspectRation: size.width < 650 ? 0.85 : 1.1,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // عنصر واجهة المستخدم لإرسال التعليقات
            const SendFeedBack()
          ],
        ),
      ),
    );
  }
}
class trainingDetail extends StatefulWidget {
  const trainingDetail({
    super.key,
    this.crossAxisCount = 3,
    this.aspectRation = 1.1,
  });

  final int crossAxisCount;
  final double aspectRation;

  @override
  State<trainingDetail> createState() => _trainingDetailState();
}

class _trainingDetailState extends State<trainingDetail> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      shrinkWrap: true, // يتم تحديد هذا الخيار لتقليص الشبكة لتناسب حجم المحتوى.

      physics: const ScrollPhysics(), // يتم تحديد هذا الخيار لعدم تمديد الشبكة أو التمرير التلقائي.

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount, childAspectRatio: widget.aspectRation),

      itemBuilder: (contxt, index) => /// تعريف دالة الانتقالية (callback) لبناء عنصر الشبكة.
      TrainingsDetail( press: ()
      {
        // navigateTo(context,CreateAccountPerson());

      },

      training: trainings[index],

      ), // يتم استخدام TrainingsDetail لبناء عنصر التفاصيل.
      itemCount: trainings.length, // يحدد عدد العناصر المعروضة في الشبكة.
    );
  }
}