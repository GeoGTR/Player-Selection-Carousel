import 'package:flutter/material.dart';

class PlayerSelectionModel with ChangeNotifier {
  final String imgPath;
  final String playerName;

  PlayerSelectionModel({
    required this.imgPath,
    required this.playerName,
  });
}
