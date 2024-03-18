class Person {
  final String personId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  // final String photo;
  final String addressStreet;
  final String addressCity;
  final String uId; // اضفت هذا الحقل

  Person({
    required this.personId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    // required this.photo,
    required this.addressStreet,
    required this.addressCity,
    required this.uId, // اضفت هذا الحقل
  });

  Map<String, dynamic> toJson() {
    return {
      'person_id': personId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'address_street': addressStreet,
      'address_city': addressCity,
      'uId': uId, // تغيير اسم الحقل إلى uId
    };
  }
}
