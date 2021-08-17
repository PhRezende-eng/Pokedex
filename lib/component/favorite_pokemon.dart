import 'package:flutter/material.dart';

class FavoritePokemon extends StatelessWidget {
  final VoidCallback onPressed;
  const FavoritePokemon({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1.2, -1.1),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.favorite_border_outlined,
          color: Colors.redAccent,
          size: 32,
        ),
      ),
    );
  }
}
