// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lol_champs_info/ui/pages/home/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            label: Text("Busque o seu heroi!"),
            hintText: " Digite Corretamente!"
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomListCardComponent(
            image: 'assets/Zed.png',
            title: "Zed - o Mestre das Sombras",
            callback: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DetailsPage()));
            },
          )
        ],
      )),
    );
  }
}

class CustomListCardComponent extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? callback;
  const CustomListCardComponent({
    Key? key,
    required this.image,
    required this.title,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Card(
        color: const Color.fromARGB(255, 255, 164, 158),
        child: Row(children: [
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 25),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ]),
      ),
    );
  }
}
