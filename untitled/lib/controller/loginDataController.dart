import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginDataController extends GetxController {
  GoogleSignInAccount? account;

  void setAccount(GoogleSignInAccount _account) {
    account = _account;
    print("set login data: " + _account.toString());
  }
}
