import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onSubmitted,
    this.onPressedSuffixIcon,
    this.controller,
  });
  final Function(String)? onSubmitted;
  final void Function()? onPressedSuffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your city';
        }
        return null;
      },
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onFieldSubmitted: onSubmitted,
      style: Style.textStyle20,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 5),
          onPressed: onPressedSuffixIcon,
          icon: const Icon(
            Icons.search,
            size: 27,
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 255, 17, 0),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.all(18),
        hintText: 'Enter a city',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 20,
        ),
      ),
    );
  }
}
