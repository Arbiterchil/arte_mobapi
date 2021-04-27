import 'package:arte/constants/color.dart';
import 'package:arte/constants/images.dart';
import 'package:arte/controllers/2-signIn_controller.dart';
import 'package:arte/elements/validators.dart';
import 'package:arte/routes/route_names.dart';
import 'package:arte/widgets/bottom_choices.dart';
import 'package:arte/widgets/button_custom.dart';
import 'package:arte/widgets/size_config.dart';
import 'package:arte/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {

  final signIn = Get.put(SignInController());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Image.asset(
                      inlogo_splash,
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 15,),
                    CustomTextfields(
                      controller: signIn.email,
                      obsecure: false,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => false,
                      hintText: 'Email',
                      icons: Icons.email,
                         onsaved: (value) => signIn.email.text = value,
                      validators: (value) => email(value),
                    ),
                    SizedBox(height: 10,),
                    CustomTextfields(
                      controller: signIn.password,
                      obsecure: true,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => false,
                      hintText: 'Password',
                      icons: Icons.lock_open_outlined,
                      onsaved: (value) => signIn.password.text = value,
                      validators: (value) => password(value),
                    ),
                    SizedBox(height: 6,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => true,
                        child: Text("Forgot Password?",
                        style: TextStyle(
                          fontFamily: 'Metropolis-Regular',
                          fontSize: 12,
                          color: light_color
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    CustomButton(
                      width: getWidth(190),
                      nameText: "Sign In",
                      color: not_sopure_black,
                      splashColor: darkish_color,
                      onPressed: () => signInNow(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          height: 40,
          child: Center(
            child: BottomXchoice(
              ontap: ()=> Get.offAllNamed(singup),
              firsttext: "Don'\t have an account yet? ",
              color: light_color,
              secondtext: "Sign Up Now.",
            ),
          ),
        ),
      ),
    );
  }

  void signInNow(){
    if(_key.currentState.validate()){
      signIn.signInNowControll();
    }
  }

}