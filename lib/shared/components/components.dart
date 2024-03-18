
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// reusable
///------------------------*/DefaultButton----------------------------
Widget defaultButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 5.0,
  required Function function,
  required String text,
}) => Container(
  width: width,
  height: 40.0,
  child: MaterialButton(
    onPressed: () => function(),
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(color: Colors.white),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: Color(0xff324e84), // يمكنك استبدال هذا اللون بلون ثابت حسب الحاجة
  ),
);

///------------------------[defaultTextButton/*----------------------------Start--

Widget defaultTextButton({ required Function function , required String text }) =>TextButton(
  onPressed: () => function() ,
  child: Text(text.toUpperCase(),
    style: TextStyle(fontWeight: FontWeight.w900),
  ),

);
///------------------------[defaultTextButton/*----------------------------End--
/////---------------------------------------------------------------------------
///------------------------[defaultFormField/*----------------------------Start--

Widget defaultFormField({
   TextEditingController? controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String?) validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  Color? fillColor,

  Color? labelColor,
  TextStyle? style,   String? id, // تحديد نمط النص هنا
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit as void Function(String)?,
  onChanged: onChanged as void Function(String)?,
  enabled: isClickable,
  onTap: onTap as void Function()?,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: labelColor ?? Colors.white),
    prefixIcon: Icon(prefix),
    suffixIcon: suffix != null
        ? IconButton(
           onPressed: suffixPressed as void Function()?,
          icon: Icon(suffix),
    )
        : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    filled: true,
    fillColor: fillColor ?? Colors.black.withOpacity(0.5),
  ),
  // استخدام النمط المحدد هنا
  style: TextStyle(color: Color.fromRGBO(255, 222, 89, 1)),

);


///---------------------------------------------------------- build TaskI tem

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}',
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 18.0,

                ),
              ),
              Text(
                '${model['date']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        // IconButton(
        //   onPressed: ()
        //   {
        //     AppCubit.get(context).updateDate(
        //       status: 'done',
        //       id: model['id'],
        //     );
        //   },
        //   icon: const Icon(
        //     Icons.check_box,
        //     color: Colors.green,
        //   ),
        // ),
        // IconButton(
        //   onPressed: () {
        //     AppCubit.get(context).updateDate(
        //       status: 'archive',
        //       id: model['id'],
        //     );
        //   },
        //   icon: const Icon(
        //     Icons.archive,
        //     color: Colors.black45,
        //   ),
        // ),
      ],
    ),
  ),
  onDismissed: (direction)
  {
    // AppCubit.get(context).deleteDate(id: model['id'],);
  },
);


///------------------------------------- tasks Builder
//
// Widget tasksBuilder({
//   required List<Map> tasks,
// }) => ConditionalBuilder(
//   condition: tasks.length > 0,
//   builder: (context) => ListView.separated(
//     itemBuilder: (context, index)
//     {
//       return buildTaskItem(tasks[index], context);
//     },
//     separatorBuilder: (context, index) => myDivider(),
//     itemCount: tasks.length,
//   ),
//   fallback: (context) => const Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.menu,
//           size: 100.0,
//           color: Colors.grey,
//         ),
//         Text(
//           'No Tasks Yet, Please Add Some Tasks',
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//   ),
// );

///-------------------------------------my Divider
    Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
    //
    //  Widget bulidArticleItem(article,context) => InkWell(
    //    onTap: ()
    //    {
    //     navigateTo(context, WebViewScreen(article['url']));
    //    },
    //    child: Padding(
    // padding: const EdgeInsets.all(20.0),
    //     child: Row(
    //      children:
    //      <Widget>[
    //      Container(
    //        height: 180,
    //       width: 180,
    //       decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20.0),
    //       image : DecorationImage(
    //       image: NetworkImage('${article['urlToImage']}',
    //        ),
    //       fit: BoxFit.cover,
    //       ),
    //
    //
    //       ),
    //          ),
    //          SizedBox(width: 20.0,
    //          ),
    //          Expanded(
    //          child: Container(
    //          height: 200,
    //          child:  Column(
    //          crossAxisAlignment: CrossAxisAlignment.start,
    //          mainAxisAlignment: MainAxisAlignment.start,
    //          mainAxisSize: MainAxisSize.min,
    //          children:
    //          [
    //          Expanded(
    //          child: Text('${article['title']}',
    //          style:Theme.of(context).textTheme.bodyText1,
    //           maxLines: 4,
    //           overflow: TextOverflow.ellipsis,
    //           ),
    //           ),
    //        Text('${article['publishedAt']}',
    //        style: TextStyle(
    //        color: Colors.grey,
    //
    //         ),
    //         ),
    //
    //
    //         ],
    //
    //         ),
    //         ),
    //         ),
    //         ],
    //         ),
    //         ),
    //  );
    //
    //  Widget articleBulider(list,context,{isSearch = false } ) =>ConditionalBuilder(
    //
    //    condition: list.length > 0,
    //    // state is! NewsGetScienceLodingState ,
    //    builder: (context) => ListView.separated(
    //      physics: BouncingScrollPhysics(),
    //      itemBuilder: (context, index) => bulidArticleItem(list[index],context),
    //      separatorBuilder: (context, index) => myDivider(),
    //      itemCount: 10,
    //    ) ,
    //    /// isSearch دي علشان التحميل علامة التحميل في البحث بدل ما يلود علي الفاضي قبل البحث
    //    fallback: (context) => isSearch ? Container() : Center(
    //        child: CircularProgressIndicator()
    //    ),
    //  );


///------------------------[navigateTo/*----------------------------staet--
     void navigateTo(context,widget) =>  Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) =>widget ,
       ),
     );


///------------------------[navigateTo/*----------------------------end--
//----------------------------------------------------------------------
///------------------------[navigateAndFininsh/*--------------------staet--

void navigateAndFininsh(context,widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>widget,),
      (route)
      {
        return false;
      }
    );

///------------------------[navigateAndFininsh/*--------------------End--
//-----------------------------------------------------------------------


Widget verticalSpace() => SizedBox(height: 30,);
Widget horthontalSpace() => SizedBox(width: 30,);

//

