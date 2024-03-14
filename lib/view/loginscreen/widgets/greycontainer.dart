import 'package:flutter/material.dart';
import 'package:umall/utils/colors.dart';

class transparentcontainer extends StatelessWidget {
  const transparentcontainer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
        top: screenHeight * 0.484,
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
}
