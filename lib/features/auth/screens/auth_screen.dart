import 'package:amazon_clone/utils/app_widgets/custom_button.dart';
import 'package:amazon_clone/utils/app_widgets/custom_textformfield.dart';
import 'package:amazon_clone/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth auth = Auth.signUp;

  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: auth == Auth.signUp ? AppColors.backgroundColor: AppColors.greyBackgroundColor,
                title: const Text(
                  'Create an account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.secondaryColor,
                  value: Auth.signUp,
                  groupValue: auth,
                  onChanged: (value) {
                    setState(() {
                      auth = value!;
                    });
                  },
                ),
              ),
              if (auth == Auth.signUp)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: AppColors.backgroundColor,
                  child: Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: 'Sign Up',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: auth == Auth.signIn ? AppColors.backgroundColor: AppColors.greyBackgroundColor,
                title: const Text(
                  'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.secondaryColor,
                  value: Auth.signIn,
                  groupValue: auth,
                  onChanged: (value) {
                    setState(() {
                      auth = value!;
                    });
                  },
                ),
              ),
              if (auth == Auth.signIn)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: AppColors.backgroundColor,
                  child: Form(
                    key: signInFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: 'Sign In',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
