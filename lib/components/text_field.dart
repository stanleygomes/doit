import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:doit/config/theme.dart';

class CTextField extends StatelessWidget {
  final bool? autofocus;
  final String? keyboardType;
  final bool? isPassword;
  final Function(String?)? onChanged;
  final String placeholder;
  final TextEditingController? controller;

  CTextField({
    Key? key,
    this.autofocus,
    this.keyboardType,
    this.isPassword,
    this.onChanged,
    this.controller,
    required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    TextInputType kType = TextInputType.text;

    switch (this.keyboardType) {
      case 'multiline':
        kType = TextInputType.multiline;
        break;
      case 'emailAddress':
        kType = TextInputType.emailAddress;
        break;
      case 'name':
        kType = TextInputType.name;
        break;
      case 'number':
        kType = TextInputType.number;
        break;
      case 'phone':
        kType = TextInputType.phone;
        break;
      case 'url':
        kType = TextInputType.url;
        break;
      case 'streetAddress':
        kType = TextInputType.streetAddress;
        break;
      case 'visiblePassword':
        kType = TextInputType.visiblePassword;
        break;
      default:
    }

    return TextFormField(
      autofocus: this.autofocus != null ? this.autofocus! : false,
      keyboardType: kType,
      onChanged: this.onChanged == null ? (e) => {} : this.onChanged!,
      obscureText: isPassword == true,
      controller: controller,
      decoration: InputDecoration(
        labelText: this.placeholder,
        labelStyle: TextStyle(
          color: colorSchemePrimary,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: colorSchemePrimary),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return t.requiredField;
        }
        return null;
      },
    );
  }
}
