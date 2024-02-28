import 'package:flutter/material.dart';

class ShapeProvider extends ChangeNotifier{
  int score = 0;
  bool isSquareAccepted = false;
  bool isCircleAccepted = false;
  bool isTriangleAccepted = false;
  bool isHexagonAccepted = false;

  bool get areAllShapesAccepted{
    return isSquareAccepted && isCircleAccepted && isTriangleAccepted && isHexagonAccepted;
  }

  set setSquareAccepted(bool value){
    isSquareAccepted = value;
    scoreFunction();
    notifyListeners();
  }
  set setCircleAccepted(bool value){
    isCircleAccepted = value;
    scoreFunction();
    notifyListeners();
  }
  set setTriangleAccepted(bool value){
    isTriangleAccepted = value;
    scoreFunction();
    notifyListeners();
  }
  set setHexagonAccepted(bool value){
    isHexagonAccepted = value;
    scoreFunction();
    notifyListeners();
  }

void resetShapes(){
    isSquareAccepted = false;
    isCircleAccepted = false;
    isTriangleAccepted = false;
    isHexagonAccepted = false;
    score = 0;
    notifyListeners();
  }
  //score function based on how many is true
  void scoreFunction(){
    //check all the bools and if true add 1 to score
    score = 0;
    if(isSquareAccepted){
      score++;
    }
    if(isCircleAccepted){
      score++;
    }
    if(isTriangleAccepted){
      score++;
    }
    if(isHexagonAccepted){
      score++;
    }
    notifyListeners();
  }
}