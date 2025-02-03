import 'package:ecommerce/api/signup_api.dart';
import 'package:ecommerce/screen/authen/signin.dart';
import 'package:ecommerce/widgets/signup_textfld.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final ApiService _apiService = ApiService(); // Instantiate ApiService

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    bool signupSuccess = await _apiService.signup(
      username: _nameController.text,
      email: _emailController.text,
      mobile: _mobileController.text,
      password: _passwordController.text,
    );

    if (signupSuccess) {
   
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign-up successful!")),
      );
     
    } else {
    
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign-up failed. Try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Sign Up")),
      body: Column(
        children: [
          SignupForm(
            formKey: _formKey,
            nameController: _nameController,
            emailController: _emailController,
            mobileController: _mobileController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            onSignup: _signup, 
          ),
          GestureDetector(
            onTap: (){Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
      );},
            child: Container(child: Text("LOGIN")))
        ],
      ),
    );
  }
}
