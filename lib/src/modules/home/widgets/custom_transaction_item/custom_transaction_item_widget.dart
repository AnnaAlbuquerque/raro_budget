import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomTransactionItem extends StatelessWidget {
  const CustomTransactionItem(
      {Key? key,
      this.title,
      this.icon,
      this.transferredValue,
      this.color,
      this.textstyle,
      this.isGradient,
      this.date})
      : super(key: key);

  final bool? isGradient;
  final TextStyle? textstyle;
  final String? title;
  final Color? color;
  final String? icon;
  final String? transferredValue;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isGradient == null
                  ? CircleAvatar(
                      backgroundColor: color,
                      child: Image(
                          image: AssetImage(
                              '${icon ?? 'assets/icons/transport.png'}')),
                    )
                  : Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.cyanToPurpleAppBar,
                      ),
                      child: Image(
                          image: AssetImage(
                              '${icon ?? 'assets/icons/transport.png'}')),
                    ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${title ?? 'Transporte'}',
                    style: TextStyles.purple16w500Roboto,
                  ),
                  Text(
                    '${date ?? DateFormat("dd/MM/yyyy").format(DateTime.now())}',
                    style: TextStyles.grey14w400Roboto,
                  ),
                ],
              ),
            ],
          ),
          Text(
            '-R\$ ${transferredValue ?? '25,00'}',
            style: textstyle,
          ),
        ],
      ),
    );
  }
}
