import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/firebase/dicoding_chatting/pages/chat_page.dart';
import 'package:fundamental_app/moduls/firebase/dicoding_chatting/pages/login_page.dart';
import 'package:fundamental_app/moduls/firebase/dicoding_chatting/pages/register_page.dart';

class PracticeChatFirebase extends StatelessWidget {
  const PracticeChatFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicoding Chatting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ChatPage.id: (context) => const ChatPage(),
      },
    );
  }
}
