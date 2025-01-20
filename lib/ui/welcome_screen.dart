import 'package:chat_app/features/login_screen/login_screen.dart';
import 'package:chat_app/ui/singup_screen.dart';
import 'package:chat_app/utils/custom_button.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatefulWidget {
  WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
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
      body: Stack(children: [
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
                height: screenHeight / 2.5,
              ),
              Text(
                'Discover Your \nDream Job here',
                style: TextStyle(
                    color: Color(0xff1F41BB),
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenHeight / 25,
              ),
              Text(
                textAlign: TextAlign.center,
                'Explore all the existing job roles based on your\n interest and study major',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: screenHeight / 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CustomButton(
                    text: "Register",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingupScreen()));
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
    );
  }
}
