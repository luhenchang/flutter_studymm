import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'deliver_one_page.dart';
/**
 * 有状态StatefulWidget
 *  继承于 StatefulWidget，通过 State 的 build 方法去构建控件
 */
class DeliveryPage extends StatefulWidget {
  ////通过构造方法传值
  DeliveryPage();

  //主要是负责创建state
  @override
  _DemoStateWidgetState createState() => _DemoStateWidgetState();
}

/**
 * 在 State 中,可以动态改变数据
 * 在 setState 之后，改变的数据会触发 Widget 重新构建刷新
 */
class _DemoStateWidgetState extends State<DeliveryPage>
    with SingleTickerProviderStateMixin {
  _DemoStateWidgetState();
  List tabs = ["收货", "关闭任务"];
  //用于控制/监听Tab菜单切换
  //TabBar和TabBarView正是通过同一个controller来实现菜单切换和滑动状态同步的。
  TabController tabController;
  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    ///在initState之后调 Called when a dependency of this [State] object changes.
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return buildTabScaffold();
  }

  //通过“bottom”属性来添加一个导航栏底部tab按钮组，将要实现的效果如下：
  Widget buildTabScaffold() {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text('输入单据号码',style: TextStyle(color:Colors.black),),
          //设置选项卡
          bottom: buildTabBar(),
          //设置标题居中
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          centerTitle: true,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }
              )
      ),

      //设置选项卡对应的page
      body: buildBodyView(),
    );
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  //这个就是切换的页面部分代码
  buildBodyView() {
    //构造 TabBarView
    Widget tabBarBodyView = TabBarView(
      controller: tabController,
      //创建Tab页  快捷键不能用。。。你可以按住ctrl+鼠标来看他的需要的类型
      children: <Widget>[
        DeliverOnePage(),
        //第二个页面你自己后面动手
        CloseTaskPage(),///我们先这样一样
      ],
//      children: tabs.map((e) {//你试一试ctrl+邮件他要的1是一个list<Widget>就是要一个部件1集合。
//        return Container(
//          alignment: Alignment.center,
//          child: Text(e, textScaleFactor: 1),
//        );
//      }).toList(),
    );
    return tabBarBodyView;
  }

  buildTabBar() {

    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.grey
            )
          )
        ),
        child: TabBar(
          //tabs 的长度超出屏幕宽度后，TabBar，是否可滚动
          //设置为false tab 将平分宽度，为true tab 将会自适应宽度
            isScrollable: false,
            //设置tab文字得类型
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            //设置tab选中得颜色
            labelColor: Colors.blueAccent,

            //设置tab未选中得颜色
            unselectedLabelColor: Colors.black,
            //设置自定义tab的指示器，CustomUnderlineTabIndicator

            indicatorSize: TabBarIndicatorSize.tab,
            //生成Tab菜单
            controller: tabController,
            //构造Tab集合
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
    );
    //构造 TabBar
//    Widget tabBar = TabBar(
//        //tabs 的长度超出屏幕宽度后，TabBar，是否可滚动
//        //设置为false tab 将平分宽度，为true tab 将会自适应宽度
//        isScrollable: false,
//        //设置tab文字得类型
//        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//        //设置tab选中得颜色
//        labelColor: Colors.blueAccent,
//
//        //设置tab未选中得颜色
//        unselectedLabelColor: Colors.black,
//        //设置自定义tab的指示器，CustomUnderlineTabIndicator
//
//        indicatorSize: TabBarIndicatorSize.tab,
//        //生成Tab菜单
//        controller: tabController,
//        //构造Tab集合
//        tabs: tabs.map((e) => Tab(text: e)).toList());
//    return tabBar;
  }
}

class CloseTaskPage extends StatefulWidget {
  @override
  _CloseTaskPageState createState() => _CloseTaskPageState();
}

class _CloseTaskPageState extends State<CloseTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Text("lalalallalall"),
      ),
    );
  }
}