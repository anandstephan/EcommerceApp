import 'package:ecommerceapp/providers/order.dart' show Orders;
import 'package:ecommerceapp/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final OrderData = Provider.of<Orders>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Order'),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: OrderData.orders.length,
          itemBuilder: (ctx, i) => OrderItem(OrderData.orders[i]),
        ));
  }
}
