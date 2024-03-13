import 'package:flutter/material.dart';

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
            ? 14
            : isVisible
                ? 13.0
                : 10.0),
    decoration: buildInputDecoration(
      type == TextFieldType.MobNo ? 'Mobile No' : 'Password',
      type == TextFieldType.MobNo ? '9936451487' : '**********',
    ).copyWith(
      suffixIcon: type == TextFieldType.Password
          ? InkWell(
              onTap: () => toggleVisibility(!isVisible),
              child: Icon(isVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.blue),
            )
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

InputDecoration buildInputDecoration(String labelText, String hintText) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    hintStyle: TextStyle(color: Colors.grey),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.red),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    errorStyle: TextStyle(
      color: Colors.red,
    ),
  );
}
