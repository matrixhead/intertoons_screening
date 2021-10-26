import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Image.asset(
                  "assets/images/white-logo-oman-phone.png",
                  height: 30,
                ),
                const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.grey[200],
              elevation: 5,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Row(children: [
                IconButton(
                  color: Colors.grey,
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                const Expanded(
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        hintText: ' Search products ...'),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
