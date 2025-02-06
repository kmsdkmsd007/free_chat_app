import 'package:chat_app/features/splash/splash_cubit/splash_cubit_cubit.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chat_app/utils/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var bloc = context.read<SplashCubitCubit>();
    bloc.checkAuthState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 12,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Stack(children: [
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 36),
                child: Image.asset("assets/images/well.png"),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight / 2.3,
                ),
                Text(
                  'PulseChat',
                  style: TextStyle(
                      color: Color(0xff1F41BB),
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: screenHeight / 65,
                ),
                Text(
                  'Feel the Pulse of Every Conversation',
                  style: TextStyle(
                      color: Color.fromARGB(255, 34, 34, 34),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: screenHeight / 75,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Keep your conversations private and your connections alive.\n Your go-to chat app for all occasions.',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.teal),
                  ),
                ),
                SizedBox(
                  height: 163,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Login",
                      onPressed: () {
                        if (navigatorKey.currentState != null) {
                          navigatorKey.currentState!.pushNamed(Routes.login);
                        } else {
                          // Handle the case when navigatorKey.currentState is null
                        }
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    CustomButton(
                      text: "Register",
                      onPressed: () {
                        navigatorKey.currentState!.pushNamed(Routes.signUp);
                        print('object');
                      },
                      backcolor: const Color.fromARGB(255, 204, 189, 189),
                      textColor: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
