import 'package:flutter/material.dart';
import 'package:unicall/constants/routes.dart';
import 'package:unicall/screens/register_screen.dart';
import 'package:unicall/widgets/base/base_button.dart';
import 'package:unicall/widgets/base/base_card.dart';
import 'package:unicall/widgets/base/base_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      resize: false,
      appBarTitle: "Home",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/logo.jpeg"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
              "Oferecemos todos os meios necessários para a conexão de seu lar com o mundo!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                shadows: [Shadow(blurRadius: 15, color: Colors.black)],
              ),
            ),
          ),
          BaseCard(
            width: MediaQuery.of(context).size.width * 0.7,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Clique aqui para cadastrar uma instalação",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                BaseButton("Cadastrar", () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen(action: "Cadastrar");
                      },
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
