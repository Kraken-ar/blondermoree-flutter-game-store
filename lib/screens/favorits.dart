import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/gameCard.dart';

class Favirate extends StatefulWidget {
   Favirate({super.key,required this.list});
  List<Game> list;
  @override
  State<Favirate> createState() => _FavirateState();
}

class _FavirateState extends State<Favirate> {
  
  void toggleFavorite(int index) {
    setState(() {
      widget.list[index].favorite =  !widget.list[index].favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
          itemCount:  widget.list.length,
          itemBuilder: (context, counter) {
            return  (widget.list[counter].favorite) ? GameCard(
              data:widget.list[counter],
              onFavoritePressed: () => toggleFavorite(counter),
              CartToggol: (){},
              
            ):Text("");
             
          },
        )
;
  }

}