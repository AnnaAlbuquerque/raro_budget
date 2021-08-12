import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/custom_appbar/custom_appbar.dart';
import '../../../shared/widgets/custom_button_logged/custom_button_logged_widget.dart';
import '../../../shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';
import './widgets/custom_dropdownbuttonform_widget.dart';

class HomeOutPage extends StatefulWidget {
  const HomeOutPage({Key? key}) : super(key: key);

  @override
  _HomeOutPageState createState() => _HomeOutPageState();
}

class _HomeOutPageState extends State<HomeOutPage> {
  TextEditingController _valueController = TextEditingController();
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
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
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconDataLeft: Icons.arrow_back,
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
                      controller: _valueController,
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
                    const SizedBox(height: 38.0),
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Text(date, style: TextStyles.purple14w500Roboto),
                      ),
                    ),
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
        onTap: () {},
      ),
    );
  }
}
