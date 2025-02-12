import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictac/CustomeTextField.dart';
import 'package:tictac/board_screen.dart';

class Home extends StatefulWidget {
static const String routeName="Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController Player1Controller=TextEditingController();
TextEditingController Player2Controller=TextEditingController();
String selectedPlayer="X";
 void initState(){
   super.initState();
   Player1Controller.addListener((){
     setState(() {

     });
   });
   Player2Controller.addListener((){
     setState(() {

     });
   });

 }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
          Color(0xff00D2FF),
          Color(0xff3A7BD5)
        ]
        )),
      child: Scaffold(backgroundColor: Colors.transparent,
body:
 Column(
    children: [
      Expanded(
        child: Stack(alignment: Alignment.center,
            children:[
          Image.asset("assets/images/XO.png",width:double.infinity ,fit: BoxFit.cover,),
              Text("Tic-Tac-Toe",style:TextStyle(fontSize: 50,fontWeight: FontWeight.w900
              ,color: Colors.white),),


            ],
          ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              Custometextfield(hint: "Player 1 name ",controller: Player1Controller,),
              SizedBox(height: 15,),
              Custometextfield(hint: "Player 2 name ",controller: Player2Controller,),

             SizedBox(height: 17,),
              Text("Pick who goes first?",style: TextStyle(
                fontSize: 24,fontWeight: FontWeight.w500,color: Colors.white
              ),
              ),
              SizedBox(height: 17,),
              Row(
                children: [
                  Expanded(
                    child: InkWell( onTap: (){
                      setState(() {
                        selectedPlayer="X";
                      });
                    },
                      child: Container(padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                        color: selectedPlayer=="X"
                            ?Colors.white
                            :Colors.transparent
                      ),
                          child: SvgPicture.asset("assets/images/X.svg")),
                    ),
                  ),
    SizedBox(width: 15,),
                  Expanded(
                    child: InkWell(onTap: (){
                      setState(() {
                        selectedPlayer="O";
                      });
                    },
                      child: Container(padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                        color: selectedPlayer=="O"
                            ?Colors.white
                            :Colors.transparent,
                      ),
                          child: SvgPicture.asset("assets/images/O.svg")),
                    ),
                  ),
                ],
              ),
SizedBox(height: 17,),
         Visibility(
           visible: Player1Controller.text.isNotEmpty&&Player2Controller.text.isNotEmpty,
           child: ElevatedButton(onPressed: (){
Navigator.of(context).pushReplacementNamed(BoardScreen.routeName,
arguments:BoardScreenArgs(Player1Name: Player1Controller.text,
    Player2Name: Player2Controller.text, SelectedPlayer: selectedPlayer)
);
           },
               child: Text("Start Game")),
         )

          ]
        ),
      ),
    ],
  ),

      ),
    );
  }
}
