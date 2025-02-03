import 'package:ecommerce/screen/home/product_list.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSignup; 

   const SignupForm({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.mobileController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignup,
  }) : super(key: key);

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextField(
            controller: nameController,
            label: "Name",
            validator: (value) => value!.isEmpty ? "Enter your name" : null,
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller: emailController,
            label: "Email",
            validator: (value) => value!.isEmpty ? "Enter a valid email" : null,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller: mobileController,
            label: "Mobile Number",
            validator: (value) => value!.isEmpty ? "Enter your mobile number" : null,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller: passwordController,
            label: "Password",
            validator: (value) => value!.length < 6 ? "Password must be at least 6 characters" : null,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller: confirmPasswordController,
            label: "Confirm Password",
            validator: (value) => value != passwordController.text ? "Passwords do not match" : null,
            obscureText: true,
          ),
          const SizedBox(height: 20),
         ElevatedButton(
  onPressed: () {
    if (formKey.currentState!.validate()) {
      onSignup(); 
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Products()),
      );
    }
  },
  child: const Text("Sign Up"),
),

        ],
      ),
    );
  }
}
