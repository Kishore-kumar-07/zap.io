import 'package:event_management/pages/login_signin_page.dart';
import 'package:event_management/pages/user/user_home.dart';
import 'package:event_management/theme/theme_constants.dart';
import 'package:flutter/material.dart';

import 'components/login_button.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LogInSignInPage(),
      ),
    );
  }
}
