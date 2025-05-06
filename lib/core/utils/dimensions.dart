import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  final BuildContext context;

  Dimensions(this.context);

  double get screenHeight => context.height;
  double get screenWidth => context.width;
  double get screenDiagonal => sqrt(pow(screenHeight, 2) + pow(screenWidth, 2));

  double get height5 => screenHeight / 186.4;
  double get height8 => screenHeight / 116.5;
  double get height10 => screenHeight / 93.2;
  double get height15 => screenHeight / 62.1;
  double get height18 => screenHeight / 51.77;
  double get height20 => screenHeight / 46.6;
  double get height30 => screenHeight / 31.0;
  double get height40 => screenHeight / 23.3;
  double get height50 => screenHeight / 18.6;
  double get height60 => screenHeight / 15.5;
  double get height70 => screenHeight / 13.3;
  double get height80 => screenHeight / 11.6;
  double get height90 => screenHeight / 10.3;
  double get height100 => screenHeight / 9.3;
  double get height120 => screenHeight / 7.7;
  double get height150 => screenHeight / 6.2;
  double get height180 => screenHeight / 5.1;
  double get height200 => screenHeight / 4.6;

  double get width5 => screenWidth / 186.4;
  double get width8 => screenWidth / 116.5;
  double get width10 => screenWidth / 93.2;
  double get width15 => screenWidth / 62.1;
  double get width20 => screenWidth / 46.6;
  double get width30 => screenWidth / 31.0;
  double get width40 => screenWidth / 23.3;
  double get width50 => screenWidth / 18.6;
  double get width60 => screenWidth / 15.5;
  double get width70 => screenWidth / 13.3;
  double get width80 => screenWidth / 11.6;
  double get width90 => screenWidth / 10.3;
  double get width100 => screenWidth / 9.3;
  double get width120 => screenWidth / 7.7;
  double get width150 => screenWidth / 6.2;
  double get width180 => screenWidth / 5.1;
  double get width200 => screenWidth / 4.6;

  double get font10 => screenDiagonal / 93.2;
  double get font12 => screenDiagonal / 77.6;
  double get font15 => screenDiagonal / 62.1;
  double get font18 => screenDiagonal / 51.77;
  double get font20 => screenDiagonal / 46.6;
  double get font24 => screenDiagonal / 38.8;
  double get font26 => screenDiagonal / 35.8;
  double get font32 => screenDiagonal / 29.15;
  double get font40 => screenDiagonal / 23.3;

  double get radius10 => screenHeight / 93.2;
  double get radius12 => screenHeight / 77.6;
  double get radius15 => screenHeight / 62.1;
  double get radius20 => screenHeight / 46.6;
  double get radius30 => screenHeight / 31.0;
  double get radius5 => screenHeight / 186.4;
  double get radius8 => screenHeight / 116.5;
  double get radius25 => screenHeight / 37.3;
  double get radius35 => screenHeight / 26.6;
  double get radius40 => screenHeight / 23.3;
  double get radius50 => screenHeight / 18.6;
  double get radius60 => screenHeight / 15.5;
  double get radius70 => screenHeight / 13.3;
  double get radius80 => screenHeight / 11.6;
  double get radius100 => screenHeight / 9.3;

  double get iconSize16 => screenDiagonal / 58.2;
  double get iconSize20 => screenDiagonal / 46.6;
  double get iconSize24 => screenDiagonal / 38.8;
  double get iconSize32 => screenDiagonal / 29.1;
  double get iconSize40 => screenDiagonal / 23.3;
  double get iconSize48 => screenDiagonal / 19.4;
  double get iconSize56 => screenDiagonal / 16.6;
  double get iconSize64 => screenDiagonal / 14.55;
  double get iconSize72 => screenDiagonal / 12.93;
  double get iconSize80 => screenDiagonal / 11.65;
  double get iconSize96 => screenDiagonal / 9.71;
  double get iconSize128 => screenDiagonal / 7.28;

  double get textFieldWidth => screenWidth / 1.3;
  double get textFieldHeight => screenHeight / 13.6;
  double get buttonWidth => (screenWidth / 1.3) * 0.8;
  double get buttonHeight => (screenHeight / 13.6) * 0.9;
}
