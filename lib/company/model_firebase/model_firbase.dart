class AddTrainingModel {
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final String location;

  AddTrainingModel({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'rating': rating,
      'location': location,
    };
  }
}
