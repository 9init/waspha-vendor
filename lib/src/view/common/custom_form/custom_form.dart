import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomFormField extends HookWidget {
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.text,
      this.isPassword = false,
      this.isOptional = false,
      this.onChanged,
      this.validator,
      this.labelText,
      this.textFieldName,
      this.paddingLeft,
      this.paddingRight,
      this.paddingTop,
      this.paddingBottom,
      });

  final TextEditingController controller;
  final String text;
  final String? labelText;
  final bool isPassword;
  final bool isOptional;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? textFieldName;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;

  @override
  Widget build(BuildContext context) {
    final isPassVisible = useState(false);

    return Padding(
      padding:  EdgeInsets.only(
        left: paddingLeft??0.0,
        right: paddingRight??0.0,
        top: paddingTop??0.0,
        bottom: paddingBottom??0.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilderTextField(
          controller: controller,
          validator: this.validator,
          obscureText: !isPassVisible.value && isPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            hintText: text,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () => isPassVisible.value = !isPassVisible.value,
                    icon: isPassVisible.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : null,
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          name: textFieldName ?? '',
        ),
      ),
    );
  }
}
