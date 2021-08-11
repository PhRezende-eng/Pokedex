import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPokemonCard extends StatelessWidget {
  final String label;
  const SearchPokemonCard(this.label, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          icon: Icon(Icons.search_outlined),
          border: InputBorder.none,
          hintText: label,
        ),
      ),
    );
  }
}
