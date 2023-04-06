import 'package:flutter/material.dart';

class GenericTextInputWithObscure extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final int? maxLines, maxLength;
  final String? hintText, previousPassword;
  final Function(String)? onSubmitted;
  final Iterable<String>? autoFill;
  final Icon? prefixIcon;

  const GenericTextInputWithObscure(
      {Key? key,
      required this.controller,
      required this.inputType,
      this.maxLines,
      this.maxLength,
      this.hintText,
      this.previousPassword,
      this.onSubmitted,
      this.autoFill,
      this.prefixIcon})
      : super(key: key);

  @override
  State<GenericTextInputWithObscure> createState() =>
      _GenericTextInputWithObscureState();
}

class _GenericTextInputWithObscureState
    extends State<GenericTextInputWithObscure> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: TextFormField(
        showCursor: true,
        obscureText: isObscure,
        controller: widget.controller,
        autofillHints: widget.autoFill,
        keyboardType: widget.inputType,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        onFieldSubmitted: widget.onSubmitted,
        cursorColor: Colors.black45,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password wajib diisi";
          }

          if (widget.previousPassword != null) {
            if (widget.previousPassword != value) {
              return "Kata sandi tidak sama dengan Kata sandi sebelumnya";
            }
          }

          return null;
        },
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Icon(
              isObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: const Color(0xFF757575),
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
