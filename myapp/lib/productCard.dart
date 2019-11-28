import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/model/model.dart';

class ProductCard extends StatelessWidget {
  final Shoes shoes;
  final int cardNum;
  ProductCard({this.shoes, this.cardNum});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(642),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(40),
              ),
              child: Container(
                width: ScreenUtil().setWidth(620),
                height: ScreenUtil().setHeight(990),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFFFFFFEE), const Color(0xFF999999), const Color(0xFF922222), const Color(0xFF977777), const Color(0xFF300000)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 8),
                      blurRadius: 8,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}