import 'package:flutter/material.dart';
import 'HomePage.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //输入框图片颜色
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool check;
  var _isShowPwd = true; //是否显示密码
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        //color: Colors.white,
//         decoration: BoxDecoration(
//           image: new DecorationImage(
//             image: new AssetImage("images/logo.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
        child: new Stack(
          children: <Widget>[
            new Positioned(
                right: 15,
                top: 45,
                child: new Text(
                  "关闭",
                  style: new TextStyle(
                      color: Color(0xff26A7F1),
                      fontSize: 15,
                      decoration: TextDecoration.none),
                )
            ),
            new Positioned(
              child: new Image.asset(
                "images/logo.png",
                width: 100,
                height: 80,
              ),
              left: 15,
              top: 20,
            ),
            new Positioned(
                top: 100,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: new Center(
                  child: new Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 40, right: 40, top: 50),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "WELCOME",
                          style: new TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        new Container(
                          margin: EdgeInsets.only(top: 40),
                          height: 60,
                          color: Colors.white,
                          child: new TextField(
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.account_circle),
                                hintText: "请输入账号",
                                fillColor: Colors.white),
                          ),
                        ),
                        new Container(
                          height: 60,
                          color: Colors.white,
                          child: new TextField(
                            obscureText: _isShowPwd,
                            decoration: new InputDecoration(
                                hintText: "请输入密码",
                                border: InputBorder.none,
                                icon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon((_isShowPwd)
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  // 点击改变显示或隐藏密码
                                  onPressed: () {
                                    setState(() {
                                      _isShowPwd = !_isShowPwd;
                                    });
                                  },
                                )
                                // fillColor: Colors.white
                                ),
                          ),
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Radio(),
                            new Text(
                              "记住密码",
                              style: new TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                        new MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          height: 45,
                          color: Colors.blue,
                          child: new Text(
                            '登录',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                decoration: TextDecoration.none),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
