

import 'package:arte/constants/color.dart';
import 'package:arte/constants/images.dart';
import 'package:arte/controllers/3-signUpcontroller.dart';
import 'package:arte/elements/validators.dart';
import 'package:arte/routes/route_names.dart';
import 'package:arte/widgets/bottom_choices.dart';
import 'package:arte/widgets/button_custom.dart';
import 'package:arte/widgets/size_config.dart';
import 'package:arte/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final signUp = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
   SizeXGet().init(context);
    return Scaffold(
      backgroundColor: decent_white,
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _key,
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(bannertop,height: 180,),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Image.asset(logo_original,width: 150,),
                                 Padding(
                              padding: const EdgeInsets.only(left: 35),
                                    child: Text("Sign Up",
                                    style: TextStyle(
                                      color: not_sopure_black,
                                      fontFamily: 'Metropolis-Bold',
                                      fontSize: 36
                                    ),),
                                  ),
                                  SizedBox(height: 5,),
                                   Padding(
                              padding: const EdgeInsets.only(left: 35),
                                    child: Text("Choose you want to become.",
                                    style: TextStyle(
                                      color: darkish_color,
                                      fontFamily: 'Metropolis-Regualr',
                                      fontSize: 18
                                    ),),
                                  ),
                                ],
                            
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(hugger,width: 180,height: 180,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: CustomTextfields(
                        controller: signUp.name,
                        obsecure: false,
                        keyboardType: TextInputType.name,
                        onChanged: (value) => false,
                        hintText: 'Name',
                        icons: Icons.person,
                        onsaved: (value) => signUp.name.text = value,
                        validators: (value) => name(signUp.name.text = value),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: CustomTextfields(
                        controller: signUp.email,
                        obsecure: false,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => false,
                        hintText: 'Email',
                        icons: Icons.email,
                           onsaved: (value) => signUp.email.text = value,
                        validators: (value) => email(signUp.email.text = value),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: CustomTextfields(
                        controller: signUp.password,
                        obsecure: true,
                        keyboardType: TextInputType.name,
                        onChanged: (value) => false,
                        hintText: 'Password',
                        icons: Icons.lock_open_rounded,
                        onsaved: (value) => signUp.password.text = value,
                        validators: (value) => password(signUp.password.text = value),
                      ),
                    ),
                    SizedBox(height: 5,),
                     CustomButton(
                      width: getWidth(190),
                      nameText: "Sign Up",
                      color: not_sopure_black,
                      splashColor: darkish_color,
                      onPressed: () => signUpNow(),
                    ),
                  // Align(
                  //   alignment: Alignment.bottomLeft,
                  //   child:  Image.asset(bannerbottom,height: 180,),
                  // ),
                  ],

                ),
              ),
            ),
          ),
        ),
      
      bottomNavigationBar: Container(
          height: 40,
          decoration: BoxDecoration(
            color: colorless,
          ),
          child: Center(
            child: BottomXchoice(
              ontap: ()=> Get.offAllNamed(signin),
              firsttext: "Already have an account? ",
              color: light_color,
              secondtext: "Sign In Now.",
            ),
          ),
        ),
      
    );
  }

  void signUpNow(){
    if(_key.currentState.validate()){
      signUp.signUpNow();
    }
  }


}