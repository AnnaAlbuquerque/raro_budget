import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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
  String checkIcon(String category, String type) {
    if (type == 'entrada') {
      if (category == 'pix') {
        return listEntrada[0];
      } else if (category == 'payments') {
        return listEntrada[1];
      } else if (category == 'doc') {
        return listEntrada[2];
      } else if (category == 'ted') {
        return listEntrada[3];
      } else if (category == 'pix') {
        return listEntrada[4];
      } else {
        return listEntrada[5];
      }
    } else if (type == 'saida') {
      if (category == 'meal') {
        return listEntrada[0];
      } else if (category == 'transport') {
        return listEntrada[1];
      } else if (category == 'trip') {
        return listEntrada[2];
      } else if (category == 'education') {
        return listEntrada[3];
      } else if (category == 'payments') {
        return listEntrada[4];
      } else {
        return listEntrada[5];
      }
    } else {
      return listEntrada[5];
    }
  }
}
