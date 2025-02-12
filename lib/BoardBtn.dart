import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef boardBtnClick = void Function(int);
class Boardbtn extends StatelessWidget {
  String symbol;
  int index;
boardBtnClick onClick;
   Boardbtn({required this.symbol,required this.onClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap:(){
          onClick(index);
        },
        child: Container(alignment: Alignment.center,
          child: symbol.isEmpty
          ?null
          :SvgPicture.asset(symbol=="X"
          ?"assets/images/X.svg"
              :"assets/images/O.svg"
          ),
        ),
      ),
    );
  }
}
