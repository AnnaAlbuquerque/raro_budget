import 'package:mobx/mobx.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountBase
    with _$CreateAccountController;

abstract class CreateAccountBase with Store {
  @observable
  int pageNumber = 1;

  @action
  void incrementPageNumber() {
    if (pageNumber < 4) {
      pageNumber++;
    }
  }

  @action
  void decrementPageNumber() {
    if (pageNumber > 1) {
      pageNumber--;
    }
  }
}
