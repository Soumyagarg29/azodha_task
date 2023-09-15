import 'package:azodha_contact_form/bloc/data/model/UserDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitForm(UserDetails userDetails) async {
    await _firestore.collection('contacts').add({
      'name': userDetails.name,
      'email': userDetails.email,
      'phoneNumber': userDetails.phone,
      'address': userDetails.address,
    });
  }



  Future<List<UserDetails>> getUserDetails() async {
    try {
      // Reference the 'users' collection in Firestore
      CollectionReference users = _firestore.collection('users');

      // Query Firestore to get all user documents
      QuerySnapshot userQuerySnapshot = await users.get();

      // Create a list to store user objects
      List<UserDetails> userList = [];

      // Iterate through the documents and convert them to User objects
      for (QueryDocumentSnapshot userSnapshot in userQuerySnapshot.docs) {
        // Convert Firestore document data to a Map
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

        // Use the fromJson constructor to create a User object
        UserDetails user = UserDetails.fromJson(userData);

        // Add the user to the list
        userList.add(user);
      }
      return userList;
    } catch (e) {
      // Handle the error, log it, or rethrow it as needed
      throw e;
    }
  }
}
