import 'package:flutter/material.dart';
import 'package:page_view_animation/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 30),
                    Text(
                      'Hirohiko \nAraki',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '7 de junho de 1960',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "é um artista de mangá japonês conhecido por sua série JoJo's Bizarre Adventure, publicada pela primeira vez na revista Weekly Shōnen Jump em 1987, que até hoje já vendeu mais de 100 milhões de cópias só no Japão e que também é conhecida por suas frequentes referências ao rock ocidental e à Itália.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
                    child: Text(
                      'Principais Obras',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: const EdgeInsets.only(bottom: 30),
                    child: PageView.builder(
                        itemCount: paintings.length,
                        controller: pageController,
                        itemBuilder: (context, i) {
                          return Transform.scale(
                            scale: 1,
                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      paintings[i]['image'],
                                      height: 370,
                                      fit: BoxFit.cover,
                                      alignment:
                                          Alignment(-pageOffset.abs() + i, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    bottom: 20,
                                    right: 10,
                                    child: Text(
                                      paintings[i]['name'],
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        backgroundColor: Colors.red,
                                        fontSize: 35,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}