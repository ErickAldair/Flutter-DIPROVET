import 'package:flutter/material.dart';
import 'package:flutter_diprovet/models/models.dart';


class ProductFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

  updateAvailable(bool value){
    print(value);
    this.product.available = value;
    notifyListeners();
  }



  bool isValidForm (){

    return formKey.currentState?.validate() ?? false;
  }
  
}