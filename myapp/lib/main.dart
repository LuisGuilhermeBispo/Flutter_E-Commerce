import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/productCard.dart';
import 'package:myapp/utils/profileClipper.dart';
import 'package:myapp/model/model.dart';
import 'brandSelector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1125,
      height: 2436,
      allowFontScaling: true
    )..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(170),
                left: ScreenUtil().setWidth(60),
                right: ScreenUtil().setWidth(80)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon:  Icon(Icons.menu),
                    onPressed: (){},
                  ),
                  ClipOval(
                    clipper: ProfileClipper(),
                    child: Image.asset(
                      "assets/portrait.jpg",
                    width: ScreenUtil().setWidth(160),
                    height: ScreenUtil().setHeight(160),
                    fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(60),
                left: ScreenUtil().setWidth(110),
                bottom: ScreenUtil().setHeight(105),
              ),
              child: Text(
                "Explorar",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            BrandSelector(brands: ["Nike", "Adidas", "Puma", "Vans"]
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(1050),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: products.length - 1,
                itemBuilder: (context, index){
                  Shoes shoes = products[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(30),
                    ),
                    child: ProductCard(
                      shoes: shoes,
                      cardNum: index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
