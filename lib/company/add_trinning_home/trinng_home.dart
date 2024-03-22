// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddTrainingForm extends StatefulWidget {
//   @override
//   _AddTrainingFormState createState() => _AddTrainingFormState();
// }
//
// class _AddTrainingFormState extends State<AddTrainingForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   double _rating = 0.0;
//   String _location = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Training'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _titleController,
//                 decoration: InputDecoration(labelText: 'Title'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a title';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a price';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 // Rating field
//                 decoration: InputDecoration(labelText: 'Rating'),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     _rating = double.parse(value);
//                   });
//                 },
//               ),
//               TextFormField(
//                 // Location field
//                 decoration: InputDecoration(labelText: 'Location'),
//                 onChanged: (value) {
//                   setState(() {
//                     _location = value;
//                   });
//                 },
//               ),
//               RaisedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     // If the form is valid, call the function to upload image and add training
//                     await uploadImageAndAddTraining();
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> uploadImageAndAddTraining() async {
//     try {
//       // Upload image to Firebase Storage
//       String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
//       firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('images/$imageFileName');
//       // Upload the selected image
//       await ref.putFile(_selectedImage);
//       // Get the download URL of the uploaded image
//       String imageUrl = await ref.getDownloadURL();
//
//       // Create AddTrainingModel object with the entered data
//       AddTrainingModel training = AddTrainingModel(
//         title: _titleController.text,
//         description: _descriptionController.text,
//         price: double.parse(_priceController.text),
//         imageUrl: imageUrl,
//         rating: _rating,
//         location: _location,
//       );
//
//       // Add the training to Firebase Firestore
//       await FirebaseFirestore.instance.collection('trainings').add(training.toJson());
//
//       // Show success message
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Success'),
//             content: Text('Training added successfully'),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//
//       // Reset fields after adding
//       _titleController.clear();
//       _descriptionController.clear();
//       _priceController.clear();
//       setState(() {
//         _rating = 0.0;
//         _location = '';
//       });
//     } catch (error) {
//       // Show error message in case of failure
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to upload image or add training: $error'),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }
//
// class AddTrainingModel {
//   final String title;
//   final String description;
//   final double price;
//   final String imageUrl;
//   final double rating;
//   final String location;
//
//   AddTrainingModel({
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//     required this.rating,
//     required this.location,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//       'price': price,
//       'image_url': imageUrl,
//       'rating': rating,
//       'location': location,
//     };
//   }
// }
