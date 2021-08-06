import 'package:flutter/material.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';

class CustomGeneralBalance extends StatefulWidget {
  const CustomGeneralBalance({Key? key, this.balance}) : super(key: key);
  final String? balance;
  @override
  _CustomGeneralBalanceState createState() => _CustomGeneralBalanceState();
}

class _CustomGeneralBalanceState extends State<CustomGeneralBalance> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.12),
              offset: Offset(0.0, 1.0),
              blurRadius: 8.0,
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.14),
              offset: Offset(0.0, 3.0),
              blurRadius: 4.0,
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              offset: Offset(0.0, 3.0),
              blurRadius: 3.0,
              spreadRadius: -2.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saldo geral',
                    style: TextStyles.purple20w500Roboto,
                  ),
                  IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.purple,
                    ),
                    onPressed: () => setState(() => isVisible = !isVisible),
                  ),
                ],
              ),
              Text(
                'R\$ ${widget.balance ?? '3.000,00'}',
                style: TextStyles.black24w400Roboto,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
