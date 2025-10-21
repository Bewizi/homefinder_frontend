import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  static const String routeName = '/signUp';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailAddressController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailAddressController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  String getSignUpData() {
    return '${_fullNameController.text}|${_phoneNumberController.text}|${_emailAddressController.text}|${_passwordController.text}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 150),
            child: Column(children: []),
          ),
        ),
      ),
    );
  }
}
