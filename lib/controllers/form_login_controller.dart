import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLoginController extends GetxController {
  final RxString _username = RxString('');
  RxnString errorText = RxnString();
  Rxn<VoidCallback> submitFunc = Rxn<VoidCallback>();

  @override
  void onInit() {
    super.onInit();
    debounce<String>(_username, validations,
        time: const Duration(milliseconds: 500));
  }

  String get username => _username.value;

  set username(String value) => _username.value = value;

  Future<void> validations(String val) async {
    errorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (lengthOK(val) && await available(val)) {
        print('All validations passed, enable submit btn...');
        submitFunc.value = submitFunction();
        errorText.value = null;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 5}) {
    if (val.length < minLen) {
      errorText.value = 'min. 5 chars';
      return false;
    }
    return true;
  }

  Future<bool> available(String val) async {
    print('Query availability of: $val');
    await Future.delayed(
        const Duration(seconds: 1), () => print('Available query returned'));

    if (val == 'Sylvester') {
      errorText.value = 'Name Taken';
      return false;
    }
    return true;
  }

  void usernameChanged(String val) {
    _username.value = val;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      print('Make database call to create ${_username.value} account');
      await Future.delayed(
          const Duration(seconds: 1), () => print('User account created'));
      return true;
    };
  }
}
