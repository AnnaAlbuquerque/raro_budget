import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';

class CustomDropDownButton extends StatefulWidget {
  final IconData iconData;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final bool isTransparent;

  const CustomDropDownButton({
    Key? key,
    required this.iconData,
    required this.onChanged,
    required this.items,
    required this.value,
    required this.isTransparent,
  }) : super(key: key);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isTransparent == true
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.whitetransparent,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: AppColors.whitetransparent,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    widget.iconData,
                    color: AppColors.white,
                    size: 14,
                  ),
                ),
                value: widget.value,
                items: widget.items,
                onChanged: widget.onChanged,
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              gradient: AppColors.cyanToPurpleAppBar,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: AppColors.purple.withOpacity(0.6),
                icon: Icon(
                  widget.iconData,
                  color: AppColors.white,
                  size: 14,
                ),
                value: widget.value,
                items: widget.items,
                onChanged: widget.onChanged,
              ),
            ),
          );
  }
}
