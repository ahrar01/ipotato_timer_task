import 'package:flutter/material.dart';

class MaterialAppContainer extends StatelessWidget {
  const MaterialAppContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: child,
      ),
    );
  }
}
