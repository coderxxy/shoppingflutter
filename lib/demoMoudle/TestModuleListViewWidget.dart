import 'package:flutter/material.dart';

class TestModuleListViewWidget extends StatelessWidget {

  final String itemTitle;
  const TestModuleListViewWidget({super.key, this.itemTitle = "TestModuleListViewWidget"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          itemTitle,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.list, color: Colors.blueAccent.withAlpha(200),),
              title:const Text("ListView"),
              subtitle:const Text("ListView"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ListViewWidget()));
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.build_circle, color: Colors.blueAccent.withAlpha(200),),
              title:const Text("ListView.builder"),
              subtitle:const Text("builder"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ListViewBuilderWidget()));
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.linear_scale_sharp, color: Colors.blueAccent.withAlpha(200),),
              title: const Text("ListView.separated"),
              subtitle: const Text("separated"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder) =>const ListViewSeparatedWidget()));
              },
            ),
            const Divider(),

            ListTile(
              leading: Icon(Icons.dashboard_customize, color: Colors.blueAccent.withAlpha(200),),
              title: const Text("ListView.custom"),
              subtitle: const Text("custom"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=> const ListCustomViewWidget()));
              },
            ),
            Divider(),
          ],
        ),
      ),
      // body: Container(
      //   color: Colors.blueGrey,
      // ),
    );
  }
}

// ListView的创建方式有多种：
// ListView()
// TODO: ListView
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("1111111"),
            leading: CircleAvatar(
              child: Icon(Icons.account_box)
            ),
            trailing: ElevatedButton(onPressed: (){}, child: Text("1111")),
          ),
          Divider(),

          ListTile(
            title: Text("1111111"),
            leading: Image(
                image: NetworkImage("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F198311b6-04f9-4fb8-9c42-478e87eafa02%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1725439076&t=bac16a348fb7abc7db1178fde731d439"),
            ),
          ),
          Divider(),

          ListTile(
            title: Text("1111111"),
          ),
          Divider(),

        ],
      ),
      appBar: AppBar(
        title:const Text("ListView"),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

// ListView.builder()
// TODO: builder
class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrange,
        child: Column(
          children: [
            // const ListTile(
            //   title: Text("listview header label"),
            // ),
            Container(
              padding:const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width, // 获取当前屏幕尺寸
              color: Colors.white,
              // child:const Row(
              //   children: [
              //     CircleAvatar(child: Image(image: NetworkImage("https://img2.baidu.com/it/u=530676265,1788125225&fm=253&fmt=auto&app=138&f=JPEG?w=801&h=800")),),
              //     Text("生肖")
              //   ],
              // ),
              child:const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  CircleAvatar(child: Image(image: NetworkImage("https://img2.baidu.com/it/u=530676265,1788125225&fm=253&fmt=auto&app=138&f=JPEG?w=801&h=800")),),
                  Text(
                      "生肖",
                  )
                ],
              ),
            ),
            Expanded(
                child:ListView.builder(
                    itemCount: 20,
                    itemExtent: 44.0,
                    itemBuilder: (BuildContext context, int idx){
                      return ListTile(
                        title: Text("cell:"  "$idx \n"),
                      );
                    }
                ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title:const Text("builder"),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}

// ListView.separated()
// TODO: separated
class ListViewSeparatedWidget extends StatelessWidget {
  const ListViewSeparatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightGreen,
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("cell: " "$index"),
              );
            },
            separatorBuilder: (BuildContext context, int index){
              return index%2 == 0?const Divider(color: Colors.red,):const Divider(color: Colors.greenAccent,);
            },
            itemCount: 20
        ),
      ),
      appBar: AppBar(
        title: const Text("separated"),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}

// ListView.custom()
// TODO: listView Custom
class ListCustomViewWidget extends StatelessWidget {
  const ListCustomViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
      ),
      appBar: AppBar(
        title: const Text("Custom"),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
