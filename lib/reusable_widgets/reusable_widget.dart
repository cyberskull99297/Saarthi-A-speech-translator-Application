import 'package:ai_asistant/utils/pallete.dart';
import 'package:flutter/material.dart';

// final String headerText;
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    // color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Widget featureBox(BuildContext context, Color color, String headerText,
    String descriptionText) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ).copyWith(topLeft: Radius.zero),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, bottom: 45, right: 35),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            headerText,
            style: const TextStyle(
                color: Pallete.blackColor,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          descriptionText,
          style: const TextStyle(
              color: Pallete.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )
      ]),
    ),
  );
  // );
}
