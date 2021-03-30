import 'package:flutter/material.dart';
import '../providers/order.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Rs. ${order.amount}'),
            subtitle: Text(DateFormat('dd MM YYYY').format(order.dateTime)),
            trailing:
                IconButton(icon: Icon(Icons.expand_more), onPressed: () {}),
          )
        ],
      ),
    );
  }
}
