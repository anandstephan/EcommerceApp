import 'package:ecommerceapp/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  final double price;
  final int quantity;

  CartItem({this.id, this.title, this.price, this.quantity, this.productId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(child: Text('Rs $price'))),
            ),
            title: Text('$title'),
            subtitle: Text('Total ${quantity} * ${price}'),
            trailing: Text('${quantity} x'),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are You Sure ?'),
            content: Text('Do you want to remove the item from the Cart!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: Text("No")),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: Text("Yes")),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
    );
  }
}
