import 'package:flutter/material.dart';

class CloseTaskPage extends StatefulWidget {
  @override
  _CloseTaskPageState createState() => _CloseTaskPageState();
}

class _CloseTaskPageState extends State<CloseTaskPage> {

  @override
  void initState() {
    //2。

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //第一步。一个输入框里面文字和后面的一个图片。
        //第二部。ListView.builder(itemBuilder: null)搞定。注意swrap=true属性
          //1。你的数据需要一个集合List<Danhao> class Danhao{var rwdh;var state;var iscloseOrOpen=false}
          //2。你需要在你initState里面去搞一个集合如上面2。集合里面扔5个对象。
          //3。然后进行展示。


      ],
    );
  }
}
