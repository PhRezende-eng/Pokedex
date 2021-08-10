import 'package:flutter/material.dart';

class TypeBox extends StatelessWidget {
  final String type;
  const TypeBox({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(type),
        ],
      ),
    );
  }
}
