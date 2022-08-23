import 'package:flutter/material.dart';
import 'package:submission_app/screens/home.dart';
import 'package:submission_app/screens/register.dart';
import 'package:submission_app/widgets/button.dart';
import 'package:submission_app/widgets/text_field.dart';
import 'package:submission_app/widgets/title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 900) {
        return const LoginPageWeb();
      } else {
        return const LoginPageMobile();
      }
    });
  }
}

class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({Key? key}) : super(key: key);

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
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
            Align(alignment: Alignment.center, child: titleCustom('Log In')),
            const SizedBox(height: 25),
            textFieldCustom('Email', _emailController),
            const SizedBox(height: 15),
            textFieldCustom('Password', _passwordController),
            const SizedBox(height: 15),
            _buttonLogin(context, _emailController, _passwordController),
            const SizedBox(height: 10),
            _registerNow(context),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class LoginPageWeb extends StatefulWidget {
  const LoginPageWeb({Key? key}) : super(key: key);

  @override
  State<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
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
            Align(alignment: Alignment.center, child: titleCustom('Log In')),
            const SizedBox(height: 25),
            textFieldCustom('Email', _emailController),
            const SizedBox(height: 15),
            textFieldCustom('Password', _passwordController),
            const SizedBox(height: 15),
            _buttonLogin(context, _emailController, _passwordController),
            const SizedBox(height: 10),
            _registerNow(context),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

InkWell _buttonLogin(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController) {
  return InkWell(
    onTap: () => {
      if (emailController.text != '' && passwordController.text != '')
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
    child: buttonCustom('Log In'),
  );
}

Row _registerNow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Dont have account ?'),
      InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterScreen())),
        child: const Text(
          ' Register now',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
