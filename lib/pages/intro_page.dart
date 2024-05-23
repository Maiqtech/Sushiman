import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/botao.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            // shop name
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/imagens/salmao_bolinhas.png'),
            ),
          

            const SizedBox(height: 25),

            // title
            Text("O SABOR DA COMIDA JAPONESA",
                style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 10),
            // subtitle

            Text(
              "sinta o sabor da comida japonesa mais popular em qualquer lugar e a qualquer hora",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
              ),

              const SizedBox(height: 25),
            // get started button

            MyButton(
              text: "INICIAR",
              onTap: (){
                //ir para o pagina menu
                Navigator.pushNamed(context, '/menupage');
              },
              )
          ],
        ),
      ),
    );
  }
}