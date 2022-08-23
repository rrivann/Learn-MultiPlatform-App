import 'package:flutter/material.dart';
import 'package:submission_app/screens/home.dart';
import 'package:submission_app/widgets/button.dart';
import 'package:submission_app/widgets/text_field.dart';
import 'package:submission_app/widgets/title.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 900) {
        return const RegisterPageWeb();
      } else {
        return const RegisterPageMobile();
      }
    });
  }
}

class RegisterPageMobile extends StatefulWidget {
  const RegisterPageMobile({Key? key}) : super(key: key);

  @override
  State<RegisterPageMobile> createState() => _RegisterPageMobileState();
}

class _RegisterPageMobileState extends State<RegisterPageMobile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: titleCustom('Register Todo App')),
              const SizedBox(height: 25),
              textFieldCustom('First Name', _firstNameController),
              const SizedBox(height: 15),
              textFieldCustom('Last Name', _lastNameController),
              const SizedBox(height: 15),
              textFieldCustom('Email', _emailController),
              const SizedBox(height: 15),
              textFieldCustom('Password', _passwordController),
              const SizedBox(height: 15),
              _buttonRegister(context, _firstNameController,
                  _lastNameController, _emailController, _passwordController),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPageWeb extends StatefulWidget {
  const RegisterPageWeb({Key? key}) : super(key: key);

  @override
  State<RegisterPageWeb> createState() => _RegisterPageWebState();
}

class _RegisterPageWebState extends State<RegisterPageWeb> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: titleCustom('Register Todo App')),
              const SizedBox(height: 25),
              textFieldCustom('First Name', _firstNameController),
              const SizedBox(height: 15),
              textFieldCustom('Last Name', _lastNameController),
              const SizedBox(height: 15),
              textFieldCustom('Email', _emailController),
              const SizedBox(height: 15),
              textFieldCustom('Password', _passwordController),
              const SizedBox(height: 15),
              _buttonRegister(context, _firstNameController,
                  _lastNameController, _emailController, _passwordController),
            ],
          ),
        ),
      ),
    );
  }
}

InkWell _buttonRegister(
    BuildContext context,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController emailController,
    TextEditingController passwordController) {
  return InkWell(
    onTap: () => {
      if (firstNameController.text != '' &&
          lastNameController.text != '' &&
          emailController.text != '' &&
          passwordController.text != '')
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()))
        }
      else
        {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Alert !!'),
                  content: const Text('Please fill the field'),
                  actions: [
                    MaterialButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    )
                  ],
                );
              })
        }
    },
    child: buttonCustom('Register'),
  );
}
