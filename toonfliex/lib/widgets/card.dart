import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final bool isInverted;
  final String where, smallwhere, much;
  final IconData icon;
  final double offset;

  const MyCard(
      {super.key,
      required this.isInverted,
      required this.where,
      required this.much,
      required this.smallwhere,
      required this.icon,
      required this.offset});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offset * -20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: isInverted ? Colors.white : Color(0xFF1F2123),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(where,
                      style: TextStyle(
                        color: isInverted ? Colors.black : Colors.white,
                        fontSize: 20,
                      )),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Text(much,
                          style: TextStyle(
                              color: isInverted
                                  ? Colors.black
                                  : Colors.white.withOpacity(0.5))),
                      SizedBox(
                        width: 5,
                      ),
                      Text(smallwhere,
                          style: TextStyle(
                              color: isInverted
                                  ? Colors.black
                                  : Colors.white.withOpacity(0.5)))
                    ],
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(-20, 17),
                child: Transform.scale(
                  scale: 5,
                  child: Icon(
                    icon,
                    color: isInverted ? Colors.black : Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
