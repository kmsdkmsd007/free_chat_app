import 'package:chat_app/features/login/login/Login_states.dart';
import 'package:chat_app/features/login/login/login_bloc.dart';
import 'package:chat_app/features/login/login/login_event.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/custom_button.dart';
import 'package:chat_app/utils/custom_text.dart';
import 'package:chat_app/utils/custom_textformfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/utils/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailContrioller = TextEditingController();
  final passwardContrioller = TextEditingController();
  final repasswardContrioller = TextEditingController();
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bloc = context.read<LoginBloc>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 12,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showDialog(
                context: context,
                builder: (c) => Center(
                      child: CircularProgressIndicator(),
                    ));
          }
          print(state.toString());
        },
        builder: (contextt, state) => state is LoginFailureState
            ? Center(
                child: Text(state.message),
              )
            : SingleChildScrollView(
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/e2.png',
                          height: screenHeight * .35,
                          width: screenWidth * 0.94,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/e1.png',
                          width: screenWidth / 1.7,
                          height: screenHeight / 3.13,
                        ),
                      ],
                    ),
                    Center(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * .08),
                            CustomText(
                              text: "Login here",
                              size: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: screenHeight * .009,
                            ),
                            Center(
                              child: CustomText(
                                color: Colors.black,
                                text: "Welcome back you’ve\n been missed!",
                                size: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * .04,
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
                              height: screenHeight / 70,
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
                            SizedBox(
                              height: screenHeight / 30,
                            ),
                            CustomButton(
                              text: "Login",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  bloc.add(LoginUserEvent(
                                      email: emailContrioller.text,
                                      passwoed: passwardContrioller.text));
                                }
                              },
                              width: screenHeight / 2.4,
                            ),
                            SizedBox(
                              height: screenHeight / 30,
                            ),
                            CustomText(
                              text: 'Create a new account',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              size: 18,
                            ),
                            TextButton(
                                onPressed: () {
                                  navigatorKey.currentState!
                                      .pushReplacementNamed(Routes.signUp);
                                },
                                child: Text(
                                  'Sign Up',
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
    );
  }
}
