import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/constant/appDefault.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/LoginDataController.dart';
import 'package:untitled/view/bottomNavigationBarPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginDataController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppDefault.mainColor.withOpacity(0.25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // title(),
                loginWithGoogleButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return SizedBox(
      width: AppDefault.width * 0.9,
      child: Image.asset(
        'assets/images/nalang.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget loginWithGoogleButton(context) {
    return SizedBox(
      width: AppDefault.width * 0.9,
      height: 50,
      child: InkWell(
        onTap: () => googleLogin(context),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/glogo.png',
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              Text('Start with Google',
                  style: TextStyle(
                    color: AppDefault.mainColor,
                    fontSize: 16,
                    fontFamily: 'Noto_Sans',
                    fontWeight: FontWeight.bold,
                  )),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 35,
              )
            ],
          ),
        ),
      ),
      // child: ElevatedButton(
      //   onPressed: () => googleLogin(context),
      //   style: AppDefault.bigButton,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Image.asset('assets/images/glogo.png'),
      //       Text('Start with Google', style: AppDefault.smallText),
      //       Opacity(
      //           opacity: 0.0, child: Image.asset('assets/images/glogo.png')),
      //     ],
      //   ),
      // ),
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
    Get.find<LoginDataController>().setAccount(account!);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarPage()));
  }
}
