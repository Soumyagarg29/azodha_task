import 'package:azodha_contact_form/bloc/data/model/UserDetails.dart';
import 'package:azodha_contact_form/bloc/domain/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name Input
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),

            // Email Input
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            // Phone Number Input
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),

            // Address Input
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
              maxLines: 3, // Allow multiple lines for the address
            ),
            SizedBox(height: 32),

            // Submit Button
            ElevatedButton(
  onPressed: () {
    // Handle the button press event here
    final userDetails = UserDetails(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
    );

    // Dispatch the AddContactEvent to the Bloc
    BlocProvider.of<UserDetailsBloc>(context).add(UserInfo(userDetails: userDetails));
  },
  child: Text('Submit'),
)

          ],
        ),
      ),
    );
  }
}
