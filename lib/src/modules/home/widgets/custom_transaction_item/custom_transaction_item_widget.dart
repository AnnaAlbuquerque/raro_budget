import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_controller.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomTransactionItem extends StatefulWidget {
  const CustomTransactionItem(
      Key? key,
      this.title,
      this.category,
      this.icon,
      this.transferredValue,
      this.color,
      this.textstyle,
      this.type,
      this.date,
      this.timestamp)
      : super(key: key);

  final String? type;
  final String? category;
  final TextStyle? textstyle;
  final String? title;
  final Color? color;
  final String? icon;
  final num? transferredValue;
  final Timestamp timestamp;
  final DateTime? date;

  @override
  _CustomTransactionItemState createState() => _CustomTransactionItemState();
}

class _CustomTransactionItemState extends ModularState<CustomTransactionItem,
    CustomTransactionItemController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.type == 'saida'
                  ? CircleAvatar(
                      backgroundColor: widget.color,
                      child: Image(
                          image: AssetImage(
                              '${widget.icon ?? 'assets/icons/transport.png'}')),
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
                              '${widget.icon ?? 'assets/icons/transport.png'}')),
                    ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.category} ${widget.title}',
                    style: TextStyles.purple16w500Roboto,
                  ),
                  Text(
                    widget.timestamp
                        .toDate()
                        .toLocal()
                        .toString()
                        .split(' ')[0],
                    style: TextStyles.grey14w400Roboto,
                  ),
                ],
              ),
            ],
          ),
          Text(
            '${widget.transferredValue}',
            style: widget.transferredValue! <= 0
                ? widget.textstyle
                : TextStyles.purple16w500Roboto,
          ),
        ],
      ),
    );
  }
}
