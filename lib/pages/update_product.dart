import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';

import '../colors.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'UpdateProduct';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image, price;
  bool isLoading = false ;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel ;
    return Scaffold(
      backgroundColor: a1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: a1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: a3,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Update product',
            style: TextStyle(
              color: a2,
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading == false ? Column(children: [
          CustomTextField(
            hint: 'Product name',
            onChanged: (data) {
              setState(() {
                productName = data;
              });
            },
            icon: FontAwesomeIcons.fileSignature,
          ),
          CustomTextField(
            hint: 'Description',
            onChanged: (data) {
              setState(() {
                description = data;
              });
            },
            icon: FontAwesomeIcons.circleInfo,
          ),
          CustomTextField(
            hint: 'Price',
            onChanged: (data) {
              setState(() {
                price = data;
              });
            },
            icon: FontAwesomeIcons.moneyCheckDollar,
          ),
          CustomTextField(
            hint: 'Image',
            onChanged: (data) {
              setState(() {
                image = data;
              });
            },
            icon: FontAwesomeIcons.image,
          ),
          CustomButton(
              child: 'Update',
              func: () async{

                setState(() {isLoading = true ;});
                try {
                  await updateProduct(product);
                  print('Success');
                    } catch (e) {
                  print(e);

                }
                setState(() {
                  isLoading = false;
                });
              },
          ),
        ],):Center( child: CircularProgressIndicator(
          color: a3,
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
await    UpdateProductService().updateProduct(
        title: productName == null ? product.title: productName!,
        price: price == null ? product.price :price!,
        description: description== null ? product.description :description!,
        image: image == null ? product.image :image!,
        category: product.category, id: product.id);
  }
}
