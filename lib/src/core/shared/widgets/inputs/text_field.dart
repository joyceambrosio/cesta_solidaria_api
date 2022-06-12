import 'package:cartallum_app/src/core/shared/breakpoints.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String errorText;
  final bool isValid;
  final Function validateAction;
  final bool? obscure;
  final TextInputType fieldType;
  final bool? enabled;

  const FormTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    required this.isValid,
    required this.validateAction,
    this.obscure,
    required this.fieldType,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        enabled: enabled ?? true,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 14,
          color: Cores.dark,
        ),
        obscureText: obscure ?? false,
        onChanged: (value) => {
          validateAction(value),
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          focusColor: Cores.primary,
          errorText: errorText == "" ? "" : errorText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Cores.dark,
          ),
          hintText: hintText,
          fillColor: Cores.inputBackgroundColor,
          filled: true,
          suffixIcon: isValid
              ? null
              : const Icon(
                  Icons.error_outline,
                  color: Cores.danger,
                ),
          border: isValid
              ? const OutlineInputBorder(
                  borderRadius: borderRadiosAll,
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                )
              : const OutlineInputBorder(
                  borderRadius: borderRadiosAll,
                  borderSide: BorderSide(width: 0, style: BorderStyle.solid),
                ),
        ),
        cursorColor: Cores.textColor,
        keyboardType: fieldType,
      ),
    );
  }
}
