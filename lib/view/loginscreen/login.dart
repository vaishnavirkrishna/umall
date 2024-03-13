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
      resizeToAvoidBottomInset: false,
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
          transparentContainer(),
          signInContainer(),
        ],
      ),
    );
  }

  Widget transparentContainer() {
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
        top: screenHeight * 0.485,
        left: 20,
        right: 20,
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            color: ColorUtils.greyContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ));
  }

  Widget signInContainer() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: screenHeight * 0.5,
      left: 0,
      right: 0,
      child: Container(
        height: screenHeight * 0.55,
        decoration: BoxDecoration(
          color: ColorUtils.signInContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyles.welcomeBack,
                  ),
                  Text(
                    "Enter your details below",
                    style: TextStyles.smallHeading,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: SingleChildScrollView(
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
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
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
                                  child:
                                      Text("sign in", style: TextStyles.signIn),
                                ),
                              )),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Center(
                            child: Text(
                              "Forgot your password",
                              style: TextStyles.smallContainer,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?",
                                  style: TextStyles.smallContainer),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ),
                              Container(
                                height: screenHeight * 0.035,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      backgroundColor:
                                          ColorUtils.GetsStartedButton),
                                  child: Text(
                                    "Get Started",
                                    style: TextStyles.signIn,
                                  ),
                                ),
                              )
                            ],
                          ),
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
