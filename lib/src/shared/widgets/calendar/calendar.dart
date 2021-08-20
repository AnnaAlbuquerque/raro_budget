import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.calendar,
        fieldHintText: "DD/MM/AAAA",
        fieldLabelText: "Select date",
        errorFormatText: "Invalid format. Entry example: 30/01/2010");

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _selectDate(context),
      child: Text(
        '${DateFormat.yMd().format(selectedDate)}'.split(' ')[0],
        style: TextStyles.purple14w500Roboto,
      ),
    );
  }
}
