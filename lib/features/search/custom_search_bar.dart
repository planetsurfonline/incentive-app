import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.onChanged,
    required this.icon,
    required this.hintText,
  });

  final Function(String) onChanged;
  final Icon icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
      ),
      onChanged: (text) {
        onChanged(text);
      },
    );
  }
}
