import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/botao.dart';
import 'package:flutter_application_2/models/food.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity(){
    setState(() {
      quantityCount--;
    });
  }

  //increment quantity
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children:[
          //Listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: ListView(
                children: [
                  // imagem 
                  Image.asset(
                  widget.food.imagePath,
                  height: 200,
                  ),
            
                  const SizedBox(height: 25),
                  // avaliação
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow,
                      ),
                      const SizedBox(width: 5),
            
                      
                      Text(
                        widget.food.rating,
                         style: TextStyle(
                          color: Colors.grey[600],
                           fontWeight: FontWeight.bold,
                           ),
                          ),
            
                    ],
                  ),
            
                  const SizedBox(height: 10),
                  //nome da comida
                  Text(widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  //Descriçãp
                  Text(
                    "Descrição",
                     style: TextStyle(
                       color: Colors.grey[900],
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       ),
                       ),

                       const SizedBox(height: 10),

                       Text(
                        "Deliciosas fatias finas de salmão fresco se espalham elegantemente sobre um leito perfeitamente temperado de arroz.",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          height: 2,
                        
                        ),
                        )

                       ],
                      ),
            ),
        ),

          // preço + quantidade + botão adicionar ao carrinho
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
              //preço + quantidade
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                
                children: [
                //preço 
                Text(
                  "\$${widget.food.price}",
                   style: const TextStyle(
                    color: Colors.white,
                     fontWeight: FontWeight.bold,
                      fontSize: 18),
                      ),

                //quantidade
                Row(
                  children: [
                    //botao de menos
                    Container(
                      decoration: BoxDecoration(color: secondaryColor,
                      shape: BoxShape.circle
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                           color: Colors.white,
                           ),
                        onPressed: decrementQuantity ,
                      ),
                    ),
                    //contagem de quantidade
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          quantityCount.toString(), 
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            ),
                            ),
                      ),
                    ),
                    //botao mais
                   Container(
                      decoration: BoxDecoration(color: secondaryColor,
                      shape: BoxShape.circle
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                           color: Colors.white,
                           ),
                        onPressed: incrementQuantity ,
                      ),
                    )
                    
                  ],
                )
              ],),
              const SizedBox(height: 25),
              // botao adicionar ao carrinho
              MyButton(text: "Adicionar ao carrinho", onTap: addToCart),
            ],),
          )
        ],
        ),
    );
  }
}