import 'package:chat_app/features/singup/cubit/signup_cubit.dart';
import 'package:chat_app/features/singup/cubit/signup_state.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/custom_button.dart';
import 'package:chat_app/utils/custom_text.dart';
import 'package:chat_app/utils/custom_textformfiled.dart';
import 'package:chat_app/utils/meth_ext.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final emailContrioller = TextEditingController(text: 'abcd');
  final passwardContrioller = TextEditingController(text: '1234567');
  final repasswardContrioller = TextEditingController(text: '1234567');
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Step 5: Dispose the controller
    emailContrioller.dispose();
    passwardContrioller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 12,
        backgroundColor: const Color.fromARGB(255, 232, 200, 200),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          state is SignUpFailureState
              ? ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)))
              : null;
        },
        builder: (context, state) => state is SignUpLoadingState
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/e2.png',
                            height: context.height * .35,
                            width: context.width * 0.94,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/e1.png',
                            width: context.width / 1.7,
                            height: context.height / 3.13,
                          ),
                        ],
                      ),
                      Center(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: context.height * .08),
                              CustomText(
                                text: "Create a new account",
                                size: 35,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: context.height * .009,
                              ),
                              Center(
                                child: CustomText(
                                  color: Colors.black,
                                  text:
                                      "Create an account so you can explore all\n the existing jobs",
                                  size: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: context.height * .04,
                              ),
                              CustomTextFormField(
                                hintText: "Email",
                                controller: emailContrioller,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter your email';
                                  }
                                  String pattern =
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                                  RegExp regExp = RegExp(pattern);
                                  if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: context.height / 70,
                              ),
                              CustomTextFormField(
                                hintText: "Passward",
                                obscureText: true,
                                controller: passwardContrioller,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter passward";
                                  }
                                  if (value.length < 6) {
                                    return "Passward must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                              CustomTextFormField(
                                hintText: "Re-Enter passward",
                                obscureText: true,
                                controller: repasswardContrioller,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please confirm your password";
                                  }
                                  if (value != passwardContrioller.text) {
                                    return "Passwords do not match";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: context.height / 30,
                              ),
                              CustomButton(
                                text: "Register",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<SignUpCubit>().signUp(
                                        emailContrioller.text,
                                        repasswardContrioller.text,
                                        passwardContrioller.text);
                                  }
                                },
                                width: context.width / 2.4,
                              ),
                              SizedBox(
                                height: context.height / 40,
                              ),
                              CustomText(
                                text: 'If you have already account',
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                size: 18,
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigatorKey.currentState!
                                        .pushReplacementNamed(Routes.login);
                                  },
                                  child: Text(
                                    'Login Up',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
