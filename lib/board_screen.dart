import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictac/BoardBtn.dart';

class BoardScreen extends StatefulWidget {
 static const String routeName="BoardScreen";


   BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = [
    "", "", "",
    "", "", "",
    "", "", ""
  ];
  int player1Score = 0;
  int player2Score = 0;
  String message = "Player 1'S Turn";
  late String selectedPlayer;

  @override
  Widget build(BuildContext context) {
    BoardScreenArgs args = ModalRoute
        .of(context)
        ?.settings
        .arguments as BoardScreenArgs;
    selectedPlayer = args.SelectedPlayer;
    return Container(decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff00D2FF),
              Color(0xff3A7BD5)
            ]
        )),
      child: Scaffold(backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 15,
          backgroundColor: Colors.transparent, leading: Container(),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
              Container(
                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(44)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("${args.Player1Name} (${args.SelectedPlayer == "X"
                            ? "X"
                            : "O"})",
                          style: TextStyle(fontSize: 24, color: Colors.black),),
                        Text(player1Score.toString(), style: TextStyle(
                            fontSize: 24
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        Text("${args.Player2Name} (${args.SelectedPlayer == "X"
                            ? "O"
                            : "X"})",
                          style: TextStyle(fontSize: 24, color: Colors.black),),
                        Text(player2Score.toString(), style: TextStyle(
                            fontSize: 24)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32,),
            Text(message, style: TextStyle(
                color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700
            ),
            ),
            SizedBox(height: 24,),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 22),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(44)
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Boardbtn(symbol: boardState[0],
                              onClick: onBoardBtnClick,
                              index: 0,),
                            VerticalDivider(),
                            Boardbtn(symbol: boardState[1],
                              onClick: onBoardBtnClick,
                              index: 1,),
                            VerticalDivider(),
                            Boardbtn(symbol: boardState[2],
                                onClick: onBoardBtnClick,
                                index: 2),
                          ],
                        ),
                      ),
                      Divider(height: 0, color: Colors.black, thickness: 1,),


                      Expanded(
                        child: Row(
                          children: [
                            Boardbtn(symbol: boardState[3],
                                onClick: onBoardBtnClick,
                                index: 3),
                            VerticalDivider(),
                            Boardbtn(symbol: boardState[4],
                                onClick: onBoardBtnClick,
                                index: 4),
                            VerticalDivider(),
                            Boardbtn(symbol: boardState[5],
                                onClick: onBoardBtnClick,
                                index: 5),
                          ],
                        ),
                      )
                      , Divider(height: 0, color: Colors.black,),
                      Expanded(
                        child: Row(
                          children: [
                            Boardbtn(symbol: boardState[6],
                                onClick: onBoardBtnClick,
                                index: 6),
                            VerticalDivider(),
                            Boardbtn(symbol: boardState[7],
                                onClick: onBoardBtnClick,
                                index: 7),
                            VerticalDivider(),
                            Boardbtn(symbol: boardState[8],
                                onClick: onBoardBtnClick,
                                index: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int count = 1;

  onBoardBtnClick(int index,) {
    if (boardState[index].isEmpty) {
      setState(() {
        if (count.isOdd) {
          boardState[index] = selectedPlayer == "X" ? "X" : "O";
          if (checkWinner(selectedPlayer == "X" ? "X" : "O")) {
            player1Score += 1;
            message = "Player 1 Win";

            resetGame();
            return;
          }
          message = "Player 2'S Turn";
        }
        else {
          boardState[index] = selectedPlayer == "X" ? "O" : "X";
          if (checkWinner(selectedPlayer == "X" ? "O" : "X")) {
            player2Score += 1;
            message = "Player 2 Win";
            resetGame();
            return;
          }
          message = "Player 1'S Turn";
        }
        if(count==9){
          message="Draw";
          resetGame();
        }
        count++;
      }
      );
    }
  }



    bool checkWinner(String symbol) {
      for (int i = 0; i <= 6; i += 3) {
        if (boardState[i] == symbol && boardState[i + 1] == symbol &&
            boardState[i + 2] == symbol)
          return true;
      }
      for (int i = 0; i <= 2; i++) {
        if (boardState[i] == symbol && boardState[i + 3] == symbol &&
            boardState[i + 6] == symbol) {
          return true;
        }
      }
      if (boardState[0] == symbol && boardState[4] == symbol &&
          boardState[8] == symbol) {
        return true;
      }
      if (boardState[2] == symbol && boardState[4] == symbol &&
          boardState[6] == symbol) {
        return true;
      }

      return false;
    }


  resetGame() {
    Timer(Duration(seconds: 2),
            () {
          boardState = [
            "", "", "",
            "", "", "",
            "", "", ""
          ];
          count = 1;
          message = "player 1'S Turn";
          setState(() {

          });
        });
  }
}
class BoardScreenArgs{
  String Player1Name;
  String Player2Name;
  String SelectedPlayer;
  BoardScreenArgs({required this.Player1Name,required this.Player2Name,required this.SelectedPlayer});
}
