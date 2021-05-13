import 'package:crypto_currency_app/core/constants/string_constants.dart';
import 'package:mobx/mobx.dart';
part 'login_register_view_model.g.dart';

class LoginRegisterViewModel = _LoginRegisterViewModelBase
    with _$LoginRegisterViewModel;

abstract class _LoginRegisterViewModelBase with Store {}

extension EmailValidator on String {
  bool isValidEmail() {
    return StringConstant.instance.emailRegex.hasMatch(this);
  }
}
