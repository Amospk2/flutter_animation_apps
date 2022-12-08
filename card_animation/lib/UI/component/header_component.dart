import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          width: size.width,
        ),
        Positioned(
          top: 10,
          left: 25,
          child: InkWell(
            onTap: (){},
            child: Row(
              children: const [
                CircleAvatar(
                  minRadius: 15,
                  maxRadius: 25,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: Text("A", style: TextStyle(color: Colors.black),),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Amós C Dos Santos",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 25,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {},
            )),
        const Positioned(
          bottom: 15,
          left: 25,
          child: Text(
            "Saldo: 4500,65",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
