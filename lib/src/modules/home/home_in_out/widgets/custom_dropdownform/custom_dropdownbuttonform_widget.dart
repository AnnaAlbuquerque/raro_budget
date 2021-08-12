import 'package:flutter/material.dart';

class CustomDropdownButtonForm extends StatelessWidget {
  const CustomDropdownButtonForm({
    Key? key,
    this.onChanged,
    this.selectedItemBuilder,
    this.items,
    this.value,
  }) : super(key: key);

  final void Function(DropdownMenuItemData?)? onChanged;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final List<DropdownMenuItem<DropdownMenuItemData>>? items;
  final DropdownMenuItemData? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<DropdownMenuItemData>(
      decoration: InputDecoration(
        labelText: 'Tipo de saída',
        // hintText: 'Escolha',
      ),
      value: value,
      onChanged: onChanged,
      selectedItemBuilder: selectedItemBuilder,
      items: items,
    );
  }
}

class DropdownMenuItemData {
  final String category;
  final String icon;
  final Color color;

  DropdownMenuItemData({
    required this.category,
    required this.icon,
    required this.color,
  });
}
