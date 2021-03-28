import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    print("test" + product.isFavorite.toString());
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(product.isFavorite
                  ? Icons.favorite_border
                  : Icons.favorite_border_outlined),
              onPressed: () {
                product.toggleStatus();
              },
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              icon: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
