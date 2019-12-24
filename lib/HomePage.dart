import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DeliveryPage.dart';

class HomePage extends StatelessWidget {
  final title = '返回';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios),
              onPressed: (){
                Navigator.pop(context);
              }
          )
        ),
        body: LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  List listData = [
    {
      "title": '收货',
      "imageUrl": 'images/shouhuo.png',
    },
    {
      "title": '上架',
      "imageUrl": 'images/chuku.png',
    },
    {
      "title": '分拣',
      "imageUrl": 'images/jianhuo.png',
    },
    {
      "title": '库存管理',
      "imageUrl": 'images/kucun.png',
    },
    {
      "title": '库存查询',
      "imageUrl": 'images/chaxun.png',
    },
    {
      "title": '切换工作区',
      "imageUrl": 'images/qiehuan.png',
    },
    {
      "title": '设置',
      "imageUrl": 'images/shezhi.png',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
      ),
      itemCount: listData.length,
      itemBuilder: (context, position) {
        return new GestureDetector(

          onTap: () {
            if(position == 0){
              //跳转到收货页面
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => DeliveryPage()));
            }else if(position == 1){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => PutawayPage()));
            }else if(position == 2){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => PageSecond()));
            }else if(position == 3){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => PageSecond()));
            }else if(position == 4){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => PageSecond()));
            }else if(position == 5){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => PageSecond()));
            }else if(position == 6){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => PageSecond()));
            }else if(position == 7){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => PageSecond()));
            }

          },
          child: new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new Image.asset(
                    listData[position]['imageUrl'],
                    width: 35,
                    height: 35,
                  ),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width / 3 - 50,
                ),
                new Container(
                  height: 20,
                  child: new Text(
                    listData[position]['title'],
                    style: new TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
            // height: 400,  //设置高度没有反应
          ),
        );
      },
    );
  }
}



