import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_controller.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomTransactionItem extends StatefulWidget {
  final String type;
  final String category;
  final String? title;
  //TODO: checar essa tipagem
  final num? transferredValue;
  final int day;
  final int month;
  final int year;
  final Function()? onLongPress;

  const CustomTransactionItem(
    this.title,
    this.category,
    this.transferredValue,
    this.type,
    this.day,
    this.month,
    this.year,
    this.onLongPress,
  );

  @override
  _CustomTransactionItemState createState() => _CustomTransactionItemState();
}

class _CustomTransactionItemState extends ModularState<CustomTransactionItem,
    CustomTransactionItemController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onLongPress: widget.onLongPress,
        child: Container(
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
                          backgroundColor:
                              controller.checkColor(widget.category),
                          child: Image(
                              image: AssetImage(controller.checkIcon(
                                  widget.category, widget.type))))
                      : Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppColors.cyanToPurpleAppBar,
                          ),
                          child: Image(
                              image: AssetImage(controller.checkIcon(
                                  widget.category, widget.type)))),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.category}: ${widget.title}',
                        style: TextStyles.purple16w500Roboto,
                      ),
                      Text(
                        //TODO: VER SE A DATA ESTÁ SENDO EXIBIDA CORRETAMENTE
                        '${widget.day}/${widget.month}/${widget.year}',
                        style: TextStyles.grey14w400Roboto,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '${widget.transferredValue}',
                style: widget.transferredValue! < 0
                    ? TextStyles.black16w500Roboto
                    : TextStyles.purple16w500Roboto,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
