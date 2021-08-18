import 'package:flutter/material.dart';
import 'package:flutter_diprovet/models/models.dart';
import 'package:flutter_diprovet/screens/screens.dart';

import 'package:flutter_diprovet/services/services.dart';
import 'package:flutter_diprovet/widgets/widgets.dart';

import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (productService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Productos'),
        leading: IconButton(
          icon: Icon(Icons.login_outlined),
          onPressed: (){

            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: ( BuildContext context, int index) =>GestureDetector(
          onTap: () {
            productService.selectedProduct = productService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productService.products[index],
          )
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

          productService.selectedProduct = new Product(
            available: false, 
            name: '', 
            price: 0.0 
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
   );
  }
}