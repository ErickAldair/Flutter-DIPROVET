

import 'package:flutter/material.dart';
import 'package:flutter_diprovet/ui/input_decorations.dart';
import 'package:flutter_diprovet/widgets/widgets.dart';


class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white),
                  )
                ),

                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      //camara o galeria
                    },
                    icon: Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white),
                  )
                )
              ],
            ),

            _ProductForm(),
            SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: (){
          //guardar Porducto
        },
      ),
   );
  }
}

class _ProductForm extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [

              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto', 
                  labelText: 'Nombre'
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio'
                ),
              ),

              SizedBox(height: 30),

              SwitchListTile.adaptive(
                value: true, 
                title: Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: (value){
                  //pendiente
                }
              ),

              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}