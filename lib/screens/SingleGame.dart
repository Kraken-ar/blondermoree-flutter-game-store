import 'package:flutter/material.dart';
import 'package:training_project/data.dart';

class SingleGame extends StatefulWidget {
  final Game data;
  final VoidCallback onFavoriteToggle;
  final VoidCallback CartToggol;
   // Callback to update favorite state
  // final VoidCallback onAddToCart;      // Callback to add to cart

  SingleGame({
    super.key,
    required this.data,
    required this.onFavoriteToggle,
    required this.CartToggol
    //  this.onAddToCart,
  });

  @override
  State<SingleGame> createState() => _SingleGameState();
}

class _SingleGameState extends State<SingleGame> {
  

 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: const Text(
            "Description",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        body: ListView(
          children: [
            Container(
              color: Colors.grey[850],
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Image(image: AssetImage(widget.data.imagePath)),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      widget.data.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Price: ${widget.data.price}\$",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Description: ${widget.data.discreaption}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: (){  setState(() {
                            widget.CartToggol(); // Call the favorite toggle callback
                          });}, // Call the cart callback
                        child: !widget.data.cart? Icon(Icons.add_shopping_cart_sharp):Icon(Icons.remove_shopping_cart_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.onFavoriteToggle(); // Call the favorite toggle callback
                          });
                        },
                        icon: Icon(
                          widget.data.favorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.data.favorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
