import 'package:flutter/material.dart';
import 'package:markitup/provider/colorprovider.dart';
import 'package:provider/provider.dart';

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
    final colors = Provider.of<ColorProvider>(context);
    return(
      TextField(
        controller: searchController,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFF29353C)),
          ),
          fillColor: colors.secondary,
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