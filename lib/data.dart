class Game {
   String name = "";
    String price = "";
    String imagePath = "";
    String discreaption = "";
    bool favorite = false;
    bool cart = false;
    Game({ required this.name,required this.price,required this.imagePath,required this.discreaption});

}



List<Game> GamesList = <Game>[
Game(name: "Valorant : The Final Season", price: "13", imagePath: "assets/images/valo.jpg",discreaption: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Delectus eum, sapiente quasi soluta nesciunt voluptate? Nam voluptatem quis dolor, ad corrupti quas quaerat maxime accusantium doloribus, dolore asperiores, porro nostrum."),
Game(name: "Grand Thief Auto : V", price: "50", imagePath: "assets/images/gtav.jpg",discreaption: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Delectus eum, sapiente quasi soluta nesciunt voluptate? Nam voluptatem quis dolor, ad corrupti quas quaerat maxime accusantium doloribus, dolore asperiores, porro nostrum."),
Game(name: "Assassin Cread: Masters Of The Sea", price: "19", imagePath: "assets/images/assassin.jpg",discreaption: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Delectus eum, sapiente quasi soluta nesciunt voluptate? Nam voluptatem quis dolor, ad corrupti quas quaerat maxime accusantium doloribus, dolore asperiores, porro nostrum."),


];