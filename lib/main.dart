import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:player_carousel/player_carousel_view.dart';
import 'package:player_carousel/player_carousel_viewmodel.dart';
import 'package:player_carousel/player_selection_model.dart';

void main() {
  List<PlayerSelectionModel> tempList = [
    PlayerSelectionModel(
        imgPath: "assets/profiles/1.png", playerName: "Player 1"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/2.png", playerName: "Player 2"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/3.png", playerName: "Player 3"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/1.png", playerName: "Player 4"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/2.png", playerName: "Player 5"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/3.png", playerName: "Player 6"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/2.png", playerName: "Player 7"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/3.png", playerName: "Player 8"),
    PlayerSelectionModel(
        imgPath: "assets/profiles/3.png", playerName: "Player 9"),
  ];
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PlayerCarouselViewModel>(
            create: (BuildContext context) => PlayerCarouselViewModel(
                playerList: tempList,
                map: {},
                choosenName: "Player 1",
                choosenImgPath: "assets/profiles/1.png")),
        ChangeNotifierProvider<PlayerSelectionModel>(
            create: (BuildContext context) => PlayerSelectionModel(
                imgPath: "assets/profiles/1.png",
                playerName: "Player 1")),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Player Carousel Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void initState() {
    super.initState();
    Provider.of<PlayerCarouselViewModel>(context, listen: false).randomChoose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            carousel(context, screenHeight, screenWidth/2),
          ],
        ),
      ),
    );
  }
}
