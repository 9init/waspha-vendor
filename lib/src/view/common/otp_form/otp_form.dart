import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OtpForm extends HookWidget {
  OtpForm({
    super.key,
    required this.numberOfFields,
    required this.onOtpEntered,
    required this.formKey,
  });

  late final List<TextEditingController> controllers;

  final int numberOfFields;
  final GlobalKey formKey;
  final void Function(List<String>) onOtpEntered;

  @override
  Widget build(BuildContext context) {
    controllers = List.generate(
      numberOfFields,
      (index) => useTextEditingController(),
    );

    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          numberOfFields,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 54,
              width: 50,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.indigo),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  filled: true,
                  errorStyle: const TextStyle(fontSize: 0),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  hintText: "0",
                  fillColor: Colors.blueGrey[50],
                ),
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: controllers[index],
                onChanged: (value) {
                  if (value.length == 1) {
                    if (index < numberOfFields - 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    _updateOtpValues();
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateOtpValues() {
    final List<String> otpValues =
        controllers.map((controller) => controller.text).toList();
    onOtpEntered(otpValues);
  }
}
