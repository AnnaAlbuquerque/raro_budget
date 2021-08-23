import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
part 'custom_transaction_item_controller.g.dart';

@Injectable()
class CustomTransactionItemController = _CustomTransactionItemControllerBase
    with _$CustomTransactionItemController;

abstract class _CustomTransactionItemControllerBase with Store {
  List<String> listEntrada = [
    'assets/icons/pix_icon.png',
    'assets/icons/payments_icon.png',
    'assets/icons/doc_icon.png',
    'assets/icons/ted_icon.png',
    'assets/icons/pix_icon.png',
    'assets/icons/others_icon.png',
  ];

  List<String> listSaida = [
    'assets/icons/meal_icon.png',
    'assets/icons/transport_icon.png',
    'assets/icons/trip_icon.png',
    'assets/icons/education_icon.png',
    'assets/icons/payments_icon.png',
    'assets/icons/others_icon.png',
  ];

  @action
  Color checkColor(String category) {
    if (category == 'Refeições') {
      return Colors.yellow;
    } else if (category == 'Transporte') {
      return Colors.green;
    } else if (category == 'Viagem') {
      return Colors.pink;
    } else if (category == 'Educação') {
      return Colors.lightBlueAccent;
    } else if (category == 'Pagamentos') {
      return Colors.purple;
    } else {
      return Colors.lightBlue;
    }
  }

  @action
  String checkIcon(String category, String type) {
    if (type == 'Entrada' || type == 'entrada') {
      if (category == 'Pix') {
        return listEntrada[0];
      } else if (category == 'Boleto') {
        return listEntrada[1];
      } else if (category == 'Doc') {
        return listEntrada[2];
      } else if (category == 'Ted') {
        return listEntrada[3];
      } else if (category == 'Dinheiro') {
        return listEntrada[4];
      } else {
        return listEntrada[5];
      }
    } else if (type == 'Saída' ||
        type == 'saída' ||
        type == 'Saida' ||
        type == 'saida') {
      if (category == 'Refeições') {
        return listSaida[0];
      } else if (category == 'Transporte') {
        return listSaida[1];
      } else if (category == 'Viagem') {
        return listSaida[2];
      } else if (category == 'Educação') {
        return listSaida[3];
      } else if (category == 'Pagamentos') {
        return listSaida[4];
      } else {
        return listSaida[5];
      }
    } else {
      return listSaida[5];
    }
  }
}
