import 'package:flutter/material.dart';
import 'package:lol_champs_info/ui/shared/components/role_component.dart';

class Header extends StatelessWidget {
  final double value;
  const Header({
    Key? key,
    required this.value,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Positioned(
        top: 10,
        left: 10,
        child: BackButton(
          color: Colors.white,
        ),
      ),
      Positioned(
        top: 75,
        left: 25,
        child: AnimatedOpacity(
          opacity: value > 0.5 ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: Image.asset('assets/Zed.png'),
        ),
      ),
      Positioned(
        top: 75,
        left: 160,
        child: AnimatedOpacity(
          opacity: value > 0.7 ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: Column(
            children: const [
              Text(
                "Zed",
                style: TextStyle(
                    color: Colors.white, fontSize: 30),
              ),
              Text(
                "O mestre das sombras",
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 150,
        left: 150,
        height: 35,
        child: AnimatedOpacity(
          opacity: value > 0.8 ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: Row(
            children: const [
              CustomRoleComponent(
                selected: true,
                role: "JG",
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              CustomRoleComponent(
                selected:false,
                role: "MID",
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
