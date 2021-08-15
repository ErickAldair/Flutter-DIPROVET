import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {


  GlobalKey<FormState> formKey = new GlobalKey<FormState>();



  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }



  bool IsValidForm(){

  print(formKey.currentState?.validate()?? false);

    return formKey.currentState?.validate()?? false;

    
  }
}