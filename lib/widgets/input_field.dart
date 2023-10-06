import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,

    this.fontSize,
    this.controller,
    this.keyboardType,
    this.initialValue,
    this.readOnly = false,
    this.padding,
    this.prefixIcon,
    this.password = false,
    this.trailing,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.maxLines,
    this.isFilled = true,
    this.fillColor,
    this.validator,
    this.onChanged,
    this.obscureInput = false,
    this.onObscureText,
    this.borderRadius = 30,
    this.maxlength,
  }) : super(key: key);

  final String? hint;
  final double? fontSize;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final bool? password;
  final Widget? trailing;
  final GestureTapCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? textColor;
  final int? maxLines;
  final bool isFilled;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureInput;
  final void Function()? onObscureText;
  final double borderRadius;
  final int? maxlength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      maxLength: maxlength,
      controller: controller,
      style: theme.textTheme.bodyText1!.copyWith(
        color: textColor ?? theme.textTheme.bodyText1!.color,
        fontSize: fontSize,
        height: 1.5,
      ),
      keyboardType: keyboardType,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      onTap: onTap,
      readOnly: readOnly,
      textAlign: textAlign,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureInput,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: readOnly ? InputBorder.none : null,
        hintText: hint,
        hintStyle: theme.textTheme.bodyText1!.copyWith(
          color: theme.hintColor,
          fontSize: fontSize,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: textAlign == TextAlign.center
            ? null
            : Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Visibility(
                    visible: password!,
                    child: GestureDetector(
                      onTap: onObscureText,
                      child: Icon(
                        obscureInput
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 15,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: trailing != null,
                    child: trailing ?? const SizedBox(),
                  )
                ],
              ),
        filled: isFilled,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        fillColor: fillColor ?? theme.cardColor,
        enabledBorder: isFilled
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none,
              )
            : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        errorBorder: readOnly
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none,
              ),
        focusedErrorBorder: readOnly
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none,
              ),
        errorMaxLines: 4,
      ),
    );
  }
}
