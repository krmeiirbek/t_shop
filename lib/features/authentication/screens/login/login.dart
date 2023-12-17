import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: const Column(
            children: [
              TLoginHeader(),
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
