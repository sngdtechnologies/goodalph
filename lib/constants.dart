import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const defaultColor = Colors.white;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// Menu
const String menu1 = "Choose and listen";
const String menu2 = "Two-syllable word";
const String menu3 = "Three-syllable word";
const String menu4 = "Form a word";
const String menu5 = "Form a sentence";
const String menu6 = "listen and sing";

//Spacer
const space = SizedBox(height: 10.0,);

//Signe
Text signe(sign) {
  return Text(
    sign, 
    style: const TextStyle(fontSize: 30.0),
  );
}

//Size config
//--Heiht
double height(double inputHeight, BuildContext context) {
  return MediaQuery.of(context).size.height*inputHeight;
}
//--Width
double width(double inputWidth, BuildContext context) {
  return MediaQuery.of(context).size.width*inputWidth;
}

//Choice
Text choice(String chaine) { 
  return Text(
    chaine, 
    style: const TextStyle(
      color: defaultColor, 
      fontSize: 35), 
    textAlign: TextAlign.center,
  );
}