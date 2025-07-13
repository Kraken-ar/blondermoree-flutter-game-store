import 'package:flutter/material.dart';
import 'package:training_project/screens/checkout.dart';
import '../data.dart';

class Cart extends StatefulWidget {
  List<Game> list;
  
  Cart({super.key, required this.list});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _total = 0;
  void rmAll() {
    setState(() {
        for (var element in widget.list) {
          element.cart = false;
        }
    });
  }
  void toggleCart(int index) {
    setState(() {
      widget.list[index].cart = !widget.list[index].cart;
      _total = widget.list
          .where((element) => element.cart)
          .fold(0, (sum, item) => sum + int.parse(item.price));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(children: getData()),
        ),
        Container(
          color: Colors.grey[850],
          child: ListTile(
            leading: Text(
              "Total : \$$_total",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CheckoutPage(removAll: rmAll,);
                      },
                    ));

              },
              child: Text("Check Out"),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getData() {
    return List<Widget>.generate(
      widget.list.length,
      (index) {
        final element = widget.list[index];
        if (element.cart) {
          return CartItemCard(
            data: element,
            onDelete: () => toggleCart(index),
          );
        }
        return SizedBox.shrink(); // Return an empty widget for non-cart items
      },
    ).where((widget) => widget is! SizedBox).toList(); // Filter out empty widgets
  }
}

class CartItemCard extends StatelessWidget {
  final Game data;
  final VoidCallback onDelete;

  CartItemCard({required this.data, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                data.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "\$${data.price}",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
