import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_in_out/home_out_page_controller.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';
import 'package:raro_budget/src/shared/widgets/calendar/calendar.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/widgets/custom_appbar/custom_appbar.dart';
import '../../../shared/widgets/custom_button_logged/custom_button_logged_widget.dart';
import '../../../shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';
import './widgets/custom_dropdownform/custom_dropdownbuttonform_widget.dart';

class HomeOutPage extends StatefulWidget {
  const HomeOutPage({Key? key}) : super(key: key);

  @override
  _HomeOutPageState createState() => _HomeOutPageState();
}

class _HomeOutPageState
    extends ModularState<HomeOutPage, HomeOutPageController> {
  DropdownMenuItemData? item;

  List<DropdownMenuItemData> items = [
    DropdownMenuItemData(
      category: 'Refeições',
      icon: 'assets/icons/meal_icon.png',
      color: AppColors.yellow,
    ),
    DropdownMenuItemData(
      category: 'Transporte',
      icon: 'assets/icons/transport_icon.png',
      color: AppColors.green,
    ),
    DropdownMenuItemData(
      category: 'Viagem',
      icon: 'assets/icons/trip_icon.png',
      color: AppColors.pink,
    ),
    DropdownMenuItemData(
      category: 'Educação',
      icon: 'assets/icons/education_icon.png',
      color: AppColors.lightBlue,
    ),
    DropdownMenuItemData(
      category: 'Pagamentos',
      icon: 'assets/icons/payments_icon.png',
      color: AppColors.purple,
    ),
    DropdownMenuItemData(
      category: 'Outros',
      icon: 'assets/icons/others_icon.png',
      color: AppColors.lilac,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconDataLeft: Icons.arrow_back,
        iconButtonOnPressed: () {
          Modular.to.navigate('/home/homefilled');
        },
        title: 'Saída',
        prefSize: 120.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 16.0, right: 16.0, bottom: 40.0),
        child: Card(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.12),
                  offset: Offset(0.0, 1.0),
                  blurRadius: 10.0,
                ),
                BoxShadow(
                  color: AppColors.black.withOpacity(0.14),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 5.0,
                ),
                BoxShadow(
                  color: AppColors.black.withOpacity(0.2),
                  offset: Offset(0.0, 2.0),
                  blurRadius: 4.0,
                  spreadRadius: -1.0,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 54.0, top: 88.0, right: 54.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      name: 'Valor em R\$',
                      textInputType: TextInputType.number,
                      controller: controller.valueController,
                    ),
                    const SizedBox(height: 32.0),
                    CustomDropdownButtonForm(
                      value: item,
                      onChanged: (value) {
                        setState(() {
                          item = value as DropdownMenuItemData;
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return items.map<Widget>((DropdownMenuItemData item) {
                          return Row(
                            children: [
                              Text(item.category),
                            ],
                          );
                        }).toList();
                      },
                      items: items.map((DropdownMenuItemData item) {
                        return DropdownMenuItem<DropdownMenuItemData>(
                          value: item,
                          child: Row(
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: item.color,
                                  shape: BoxShape.circle,
                                ),
                                child: Image(image: AssetImage(item.icon)),
                              ),
                              const SizedBox(width: 8.0),
                              Text(item.category),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24.0),
                    CustomTextFormField(
                      name: 'Nome da saída',
                      controller: controller.nameController,
                    ),
                    const SizedBox(height: 30.0),
                    CalendarWidget(),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButtonLoggedFlow(
        useGradientBackground: true,
        text: 'INSERIR',
        useIconAdd: true,
        onTap: () {
          controller.homeRepository.insertNewOutput(
            TransactionModel(
              name: controller.nameController.text,
              type: 'saída',
              category: item!.category,
              value: double.parse(controller.valueController.text) * 100,
              day: controller.calendarController.selectedDate.day,
              month: controller.calendarController.selectedDate.month,
              year: controller.calendarController.selectedDate.year,
            ),
          );
          Modular.to.navigate('/home/homefilled');
        },
      ),
    );
  }
}

// Timestamp.fromDate(controller.calendarController.selectedDate)