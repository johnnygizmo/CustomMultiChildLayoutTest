import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class Position {
  Position(this._x, this._y);

  setPosition(double x, double y) {
    this._x = x;
    this._y = y;
  }

  double get x {
    return this._x;
  }

  double get y {
    return this._y;
  }

  double _x;
  double _y;
}

class _MyHomePageState extends State<MyHomePage> {
  List<Position> pos = List<Position>();

  @override
  Widget build(BuildContext context) {
    pos.add(Position(10, 10));
    pos.add(Position(50, 50));
    pos.add(Position(25, 100));

    return Scaffold(
      body: Container(
        child: Center(
          child: CustomMultiChildLayout(
            delegate: DragArea(pos),
            children: <Widget>[
              LayoutId(
                id: 't0',
                child: Draggable(
                  feedback: Icon(Icons.filter_vintage),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.green,
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (DraggableDetails d) {
                    setState(() {
                      pos[0].setPosition(d.offset.dx, d.offset.dy);
                    });
                  },
                ),
              ),
              LayoutId(
                id: 't1',
                child: Draggable(
                  feedback: Icon(Icons.filter_vintage),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.green,
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (DraggableDetails d) {
                    setState(() {
                      pos[1].setPosition(d.offset.dx, d.offset.dy);
                    });
                  },
                ),
              ),
              LayoutId(
                id: 't2',
                child: Draggable(
                  feedback: Icon(Icons.filter_vintage),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.green,
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (DraggableDetails d) {
                    setState(() {
                      pos[2].setPosition(d.offset.dx, d.offset.dy);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DragArea extends MultiChildLayoutDelegate {
  List<Position> _p = List<Position>();

  DragArea(this._p);

  @override
  void performLayout(Size size) {
    for (int i = 0; i < 3; i++) {
      layoutChild('t' + i.toString(), BoxConstraints.loose(size));
      positionChild('t' + i.toString(), Offset(_p[i].x, _p[i].y));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
