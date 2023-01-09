class ChampionModelBase{

  String nome;
  String description;
  String mainRoles;
  double banRate;
  double pickRate;
  double winRate;
  double numberOfMatchs;
  String image;

  
  List<String> strongAgaints;
  List<String> weekAgaints;

  ChampionModelBase({
    required this.nome,
    required this.description,
    required this.mainRoles,
    required this.banRate,
    required this.pickRate,
    required this.winRate,
    required this.numberOfMatchs,
    required this.image,
    required this.strongAgaints,
    required this.weekAgaints,
  });


}
