import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/all_products_service.dart';
import 'package:store/widgets/product_item.dart';
import '../colors.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: a1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: a1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: a3,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'New Tern',
            style: TextStyle(
              color: a2,
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 30),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartShopping,
                color: a3,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 50),
                child: FutureBuilder<List<ProductModel>>(
                  future: AllProductsService().getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel> products = snapshot.data!;
                      return GridView.builder(
                        itemCount: products.length,
                          clipBehavior: Clip.none,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return ProductItem(product: products[index],);
                          });
                    } else {
                      return Center(child: CircularProgressIndicator(color: a3,));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
