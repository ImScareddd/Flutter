import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/constant/appDefault.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/loginData.dart';
import 'package:untitled/view/bottomNavigationBarPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginData());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(height: 30),
              title(),
              Container(height: AppDefault.height * 0.25),
              loginWithGoogleButton(context),
              Container(height: 30),
              loginWithGuestButton(context),
              Container(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      "Log In",
      style: AppDefault.titleText,
    );
  }

  Widget loginWithGoogleButton(context) {
    return SizedBox(
      width: AppDefault.width * 0.9,
      child: ElevatedButton(
        onPressed: () => googleLogin(context),
        style: AppDefault.bigButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/glogo.png'),
            Text('Login with Google', style: AppDefault.smallText),
            Opacity(
                opacity: 0.0, child: Image.asset('assets/images/glogo.png')),
          ],
        ),
      ),
    );
  }

  Widget loginWithGuestButton(context) {
    return SizedBox(
      width: AppDefault.width * 0.9,
      child: ElevatedButton(
        onPressed: () => guestLogin(context),
        style: AppDefault.bigButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.person, size: 30),
            Text('Login with Guest', style: AppDefault.smallText),
            const Opacity(opacity: 0.0, child: Icon(Icons.person, size: 30)),
          ],
        ),
      ),
    );
  }

  void guestLogin(context) async {
    // const List<String> scopes = <String>[
    //   'email',
    //   'https://www.googleapis.com/auth/contacts.readonly',
    // ];

    // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: scopes);
    // GoogleSignInAccount? a = await _googleSignIn.signOut();
    // print(a.toString());
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarPage()));
  }

  void googleLogin(context) async {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: scopes);
    GoogleSignInAccount? account;
    try {
      account = await _googleSignIn.signIn();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(AppDefault.snackBar('등록되지 않은 테스트 계정입니다.'));
      print('login error!: ' + e.toString());
    }
    if (account == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(AppDefault.snackBar('등록되지 않은 테스트 계정입니다.'));
    }
    Get.find<LoginData>().setAccount(account!);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarPage()));
  }
}
