import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/update_product.dart';
import '../colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product,super.key});


 final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id ,arguments: product);
      },
      child: Stack (
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 170,
            width: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  color: a3.withOpacity(0.5),
                  spreadRadius: 0,
                  offset: const Offset(-20, 20),
                ),
              ],
              color: a2,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.title.substring(0,6),style: TextStyle(color: a5,fontSize: 15,),),
                    Text('${product.price}\$',style: TextStyle(color: a4,fontSize: 20,),),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.heart,color: a3,),),
              ],
            ),
          ),
          Positioned(
              bottom: 80,
              child: Image.network(product.image,height: 100,width: 100,)),
        ],
      ),
    );
  }
}
