import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreenDicoding extends StatefulWidget {
  const LoginScreenDicoding({Key? key}) : super(key: key);

  @override
  State<LoginScreenDicoding> createState() => _LoginScreenDicodingState();
}

class _LoginScreenDicodingState extends State<LoginScreenDicoding> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.network(
            'https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/original/commons/new-ui-logo.png',
          ),
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              _menuTile(context, 'Academy'),
              _menuTile(context, 'Challenge'),
              _menuTile(context, 'Event'),
              _menuTile(context, 'Job'),
              _menuTile(context, 'Developer'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/original/commons/certificate_logo.png',
              ),
              const SizedBox(height: 20),
              Text(
                'Masuk',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: obscureText,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                    isDense: true),
              ),
              const SizedBox(height: 8),
              Text(
                'Lupa Password?',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(decoration: TextDecoration.underline),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade800),
                onPressed: () {},
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 20),
                        color: Colors.white,
                        child: Text(
                          'atau',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.grey,
                ),
                label: Text(
                  'Masuk dengan Google',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                label: Text(
                  'Masuk dengan Facebook',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Belum punya akun? Ayo ',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: const [
                    TextSpan(
                      text: 'daftar',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Dengan melakukan login, Anda setuju dengan ',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: const [
                    TextSpan(
                      text: 'syarat & ketentuan Dicoding',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

ListTile _menuTile(BuildContext context, String title) {
  return ListTile(
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(fontWeight: FontWeight.bold),
    ),
    trailing: const Icon(
      Icons.navigate_next,
      color: Colors.black,
    ),
  );
}
