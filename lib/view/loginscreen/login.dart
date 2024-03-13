import 'package:flutter/material.dart';
import 'package:umall/utils/imageconstant.dart';
import 'package:umall/utils/textstyles.dart';
import 'package:umall/view/utils/colors.dart';
import 'package:umall/view/widgets/textformfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _mobilenoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _mobilenoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              AppImages.bgimage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: screenHeight * 0.01,
            right: screenHeight * 0.01,
            child: Image.asset(AppImages.grouplogo),
          ),
          signInContainer()
        ],
      ),
    );
  }

  Widget signInContainer() {
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: screenHeight * 0.5,
      left: 0,
      right: 0,
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStylesss.welcomeBack,
                  ),
                  Text(
                    "Enter your details given below",
                    style: TextStylesss.smallHeading,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: buildTextField(
                              validator: validateMobileNo,
                              controller: _mobilenoController,
                              isVisible: isVisible,
                              toggleVisibility: (visible) {
                                setState(() {
                                  isVisible = visible;
                                });
                              },
                              type: TextFieldType.MobNo,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: buildTextField(
                              controller: _passwordController,
                              isVisible: isVisible,
                              toggleVisibility: (visible) {
                                setState(() {
                                  isVisible = visible;
                                });
                              },
                              validator: validatePassword,
                              type: TextFieldType.Password,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                              height: screenHeight * 0.06,
                              decoration: BoxDecoration(
                                color: ColorUtils.signIn,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    "sign in",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
