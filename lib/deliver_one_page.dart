import 'package:flutter/material.dart'; //这个是谷歌设计ul风格还有一个ios的

class DeliverOnePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //这里去跟生命周期绑定。应为我们1页面可能会有数据的初始化。一些状态的变化。
    return DeliverOnePageState();
  } //
}

class DeliverOnePageState extends State<DeliverOnePage> {
  bool _switchSelected = true; //维护单选开关状态

  var _controller = TextEditingController();
  //一般的初始化数据放这里。
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("盲收"),
                  Switch(
                    value: _switchSelected, //当前状态
                    onChanged: (value) {
                      //重新构建页面
                      setState(() {
                        _switchSelected = value;
                      });
                    },
                  ),
                ],
              ),
              //框
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  print(_controller.text);

                                },
                                child: Icon(Icons.photo_camera),
                              ),
                              hoverColor: Colors.black,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "请扫描或输入PO单号",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        child: RaisedButton(
                          color: Colors.yellow,
                          child: Text("查询"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  } //
}
