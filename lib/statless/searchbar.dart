import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String)? onChange;

  const SearchBar(
      {Key? key, required this.searchController, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      child: TextField(
          style: TextStyle(fontSize: 14, height: 1.0),
          onChanged: this.onChange,
          controller: this.searchController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: 'Search app names',
          )),
    );
  }
}
