import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

import 'calendar_controller.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState
    extends ModularState<CalendarWidget, CalendarController> {
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.calendar,
        fieldHintText: "DD/MM/AAAA",
        fieldLabelText: "Select date",
        errorFormatText: "Invalid format. Entry example: 30/01/2010");

    if (picked != null && picked != controller.selectedDate)
      controller.changeDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return TextButton(
        onPressed: () => _selectDate(context),
        child: Text(
          '${DateFormat.yMd().format(controller.selectedDate)}'.split(' ')[0],
          style: TextStyles.purple14w500Roboto,
        ),
      );
    });
  }
}
