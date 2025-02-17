import 'package:flutter/material.dart';
import 'detailed_page.dart';

class Webtoon extends StatelessWidget {
  final String title;
  final dynamic thumb;
  final dynamic id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailedPage(title: title, id: id, thumb: thumb),
              fullscreenDialog: true,
            ));
      },
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Hero(
              tag: id,
              child: Image.network(
                thumb,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
