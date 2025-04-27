import 'package:flutter/material.dart';

class SearchbarFullwdh extends StatelessWidget {
  final Color txtColorLight;
  final TextEditingController searchController;
  final void Function(String) searchCallback;

  const SearchbarFullwdh({
    super.key,
    required this.txtColorLight,
    required this.searchController,
    required this.searchCallback,
  });

  @override
  Widget build(BuildContext context) {
    const searchTranslate = 'Search...';
    return(
      TextField(
        controller: searchController,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF17252A)),
          ),
          fillColor: const Color(0xFFF2EDED),
          filled: true,
          hintText: searchTranslate,
          hintStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: txtColorLight,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              // Call the search callback with the current text in the TextField
              searchCallback(searchController.text);
            },
            icon: Icon(
              Icons.search,
              semanticLabel: 'Search button',
              color: txtColorLight,
            ),
          ),
        ),
      )
    );
  }
}