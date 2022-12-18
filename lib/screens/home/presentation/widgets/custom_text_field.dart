import 'package:flutter/material.dart';

import '../../../../themes/theme_provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String fieldName;
  final String? hintText;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.fieldName,
    this.hintText,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (val) => val == "" ? "This field is required" : null,
      style: const TextStyles().materialThemeCaption,
      decoration: InputDecoration(
        labelText: fieldName,
        labelStyle: TextStyle(
          background: Paint()..color = Colors.white,
        ),
        border: normalInputBorder(context),
        enabledBorder: normalInputBorder(context),
        focusedBorder: focusedBorder(context),
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        alignLabelWithHint: true,
      ),
      controller: textEditingController,
    );
  }

  OutlineInputBorder normalInputBorder(context) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ));
  }

  OutlineInputBorder focusedBorder(context) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ));
  }
}

enum StrokeType {
  Normal,
  Stroked,
}
