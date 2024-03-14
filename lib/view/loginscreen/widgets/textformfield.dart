import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:umall/utils/imageconstant.dart';

enum TextFieldType { MobNo, Password }

Widget buildTextField({
  required TextEditingController controller,
  required bool isVisible,
  required void Function(bool) toggleVisibility,
  required TextFieldType type,
  required String? Function(String? value) validator,
}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(
      fontSize: type == TextFieldType.MobNo
          ? 18
          : isVisible
              ? 20.0
              : 10.0,
      fontWeight: type == TextFieldType.MobNo || type == TextFieldType.Password
          ? FontWeight.bold
          : null,
      color: type == TextFieldType.MobNo || type == TextFieldType.Password
          ? Colors.black
          : null,
    ),
    decoration: buildInputDecoration(
      type == TextFieldType.MobNo ? '+91' : '**********',

      // type == TextFieldType.MobNo ? '9936451487' : '**********',
    ).copyWith(
      suffixIcon: type == TextFieldType.Password
          ? InkWell(
              onTap: () => toggleVisibility(!isVisible),
              child: Image.asset(isVisible
                  ? AppImages.icon_visible
                  : AppImages.icon_invisible))
          : null,
    ),
    obscureText: type == TextFieldType.Password && !isVisible,
    validator: (value) {
      if (type == TextFieldType.MobNo) {
        return validateMobileNo(value);
      } else if (type == TextFieldType.Password) {
        return validatePassword(value);
      }
      return null;
    },
  );
}

String? validateMobileNo(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Mobile Number';
  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Please enter a valid Mobile Number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid password';
  } else if (value.length < 7) {
    return 'Password should be at least 6 characters';
  } else if (value.length > 13) {
    return 'Password should be at most 13 characters';
  }
  return null;
}

InputDecoration buildInputDecoration(String hintText) {
  return InputDecoration(
    border: InputBorder.none,
    //labelText: labelText,
    hintText: hintText,
    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    hintStyle: TextStyle(color: Colors.black),
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    errorStyle: TextStyle(
      color: Colors.red,
    ),
  );
}
