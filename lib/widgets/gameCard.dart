import 'package:flutter/material.dart';
import 'package:training_project/data.dart';
import 'package:training_project/screens/SingleGame.dart';
class GameCard extends StatelessWidget {
  GameCard({super.key, required this.data, required this.onFavoritePressed,required this.CartToggol});
  final Game data;
  final VoidCallback onFavoritePressed;
  final VoidCallback CartToggol;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image(image: AssetImage(data.imagePath)),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              data.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              "${data.price}\$",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SingleGame(data: data,onFavoriteToggle: onFavoritePressed,CartToggol:CartToggol,);
                      },
                    ));
                  },
                  child: const Text("Preview")),
              IconButton(
                onPressed: onFavoritePressed,
                icon: Icon(
                  data.favorite ? Icons.favorite : Icons.favorite_border,
                   color: data.favorite ? Colors.red : Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
