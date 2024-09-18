import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text("We've sent you a code, please check your email."),
          const Text("Please verify your email address if you haven't"),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: const Text('Send email verification code')
          ),
          TextButton(
              onPressed: () async {
               await FirebaseAuth.instance.signOut();
               Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text('Restart')
          )
        ],
      ),
    );
  }
}

//I stopped at 14:35:40