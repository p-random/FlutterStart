import 'package:flutter/material.dart';
import 'widgets/button.dart';
import 'widgets/card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1000,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 25),
                ),
                Text(
                  "\$3 502 450",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Button(
                      text: "Transfer",
                      backcolor: Colors.amber,
                      textcolor: Colors.black,
                    ),
                    SizedBox(width: 30),
                    Button(
                      text: "Request",
                      backcolor: Color(0xFF1F2123),
                      textcolor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w200,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                MyCard(
                    isInverted: false,
                    where: "Euro",
                    much: "6 428",
                    smallwhere: "EUR",
                    icon: Icons.euro),
                Transform.translate(
                  offset: Offset(0, -15),
                  child: MyCard(
                      isInverted: true,
                      where: "Bitcoin",
                      much: "9 785",
                      smallwhere: "BTC",
                      icon: Icons.currency_bitcoin),
                ),
                Transform.translate(
                  offset: Offset(0, -30),
                  child: MyCard(
                      isInverted: false,
                      where: "Dollar",
                      much: "428",
                      smallwhere: "USD",
                      icon: Icons.currency_exchange),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
