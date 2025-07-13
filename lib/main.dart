

import 'package:flutter/material.dart';
import 'package:training_project/data.dart';
import 'package:training_project/screens/SingleGame.dart';
import 'package:training_project/screens/cart.dart';
import 'package:training_project/screens/favorits.dart';
import 'package:training_project/widgets/gameCard.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main(){

  runApp( MyWidget());

}




class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Game> list = GamesList; // Initialize directly
  late final List<Widget> _pages;

    

  @override
  void initState() {
    super.initState();
    _pages = [
      Home(list: list), // Pass the list to the Home widget
      Favirate(list: list),
      Cart(list: list)
      // Pass the list to the Favorite widget
    ];
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          leading: const Center(
              child: Text("BlonderMoree",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          leadingWidth: 200,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
        body:  _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.grey[850],
          onTap:(value) => {
            setState(() {
            _currentIndex = value;
          })
          },
          items:const [
          BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_outlined, color: Colors.white),
                activeIcon: Icon(Icons.home, color: Colors.white)),
            BottomNavigationBarItem(
                label: "Favorite",
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite, color: Colors.white)),
            BottomNavigationBarItem(
                label: "Cart",
                icon: Icon(Icons.shopping_cart),
                activeIcon: Icon(Icons.home_outlined, color: Colors.white)),
          ],),
      ),
    );
 ;
  }
}



class Home extends StatefulWidget {
   Home({super.key,required this.list});
  List<Game> list ;


  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  // Access the global GamesList
 
  void toggleCart(int index) {
    setState(() {
      widget.list[index].cart =  !widget.list[index].cart;
    });
  }
  void toggleFavorite(int index) {
    setState(() {
      widget.list[index].favorite =  !widget.list[index].favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount:widget.list.length,
          itemBuilder: (context, counter) {
            return GameCard(
              data:widget.list[counter],
              onFavoritePressed: () => toggleFavorite(counter),
              CartToggol:()=>toggleCart(counter) ,
              
            );
          },
        )

   ;
  }
}
