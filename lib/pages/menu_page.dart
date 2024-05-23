import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/botao.dart';
import 'package:flutter_application_2/models/food.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/food_tile.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  // cardapio

  List cardapio =[
    //salmon sushi
    Food(
      name: "Sushi de salmão",
       price: "21.00", 
       imagePath: "lib/imagens/salmon.png",
        rating: "4.9",
        ),
    //tuna

       Food(
        name: "Atum",
        price: "23.00", 
        imagePath: "lib/imagens/maby.png",
        rating: "4.3",
        ),
  ];

  //navegue até a página de detalhes do alimento

    void navegarAteDetalhesDaComida(int index){
      Navigator.push(
        context,
         MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: cardapio[index],
          ),
           ),
         );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical:25, horizontal:12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //mensagem de promoção
                    const Text(
                      'ganhe 30% de desconto',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // redeem button
                    MyButton(
                      text: "Resgatar",
                      onTap: () {},
                    ),
                  ],
                ),


                // imagem
                Image.asset('lib/imagens/sushi.png', 
                height: 100,
                )

              ],
            ),
          ),

          const SizedBox(height: 25),

          //barra de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                   borderRadius: BorderRadius.circular(20),
                   ),
                focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white),
                   borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: 
                OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white),
                   borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Procure aqui..."
              ),
            ),
          ),

          const SizedBox(height: 25),
          //menu lista
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Text(
              "Cardápio",
               style: TextStyle(fontWeight: FontWeight.bold, 
               color: Colors.grey[800],
               fontSize: 18,
               ) 
               ),
             
          ),

          const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount: cardapio.length,
            itemBuilder: (context, index) => FoodTile(
             food: cardapio[index],
             onTap: () => navegarAteDetalhesDaComida(index),
            ),
          ),
        ),

          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [
                   //imagem
              Image.asset(
                'lib/imagens/salmao_bolinhas.png',
                height: 60,
                ),
                const SizedBox(width: 20),
              // nome e preço
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  //nome
                  Text(
                    "Salmon Eggs", 
                    style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),

                    const SizedBox(height: 10,),

                    //preço
                    Text('\$21.00',  style: TextStyle(color: Colors.grey[700]),
                    ),
                  
                ],
              ),
              ],),
              const Icon(
                Icons.favorite_outline,
               color: Colors.grey,
               size:28,

              ),


            ]),
          )
          //comida popular

        ],
      ),
    );
  }
}
