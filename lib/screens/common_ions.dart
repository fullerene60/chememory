import 'package:flutter/material.dart';
import 'package:chememory/widgets/flipcard.dart';
import 'package:chememory/widgets/feature_buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class IonScreen extends StatefulWidget {
  final List ionDataOG;

  const IonScreen({Key key, this.ionDataOG}) : super(key: key);
  @override
  IonScreenState createState() => IonScreenState();
}

class IonScreenState extends State<IonScreen> {
  List ionData;

  int currentChoice = 0;

  @override
  void initState() {
    ionData = [...widget.ionDataOG];
    super.initState();
  }

  void wrongAnswer() {
    setState(() {
      ionData.length - 1 == currentChoice ? currentChoice = 0 : currentChoice++;
    });
  }

  void correctAnswer(int val) {
    setState(() {
      if (ionData.isNotEmpty) ionData.removeAt(val);
      if (currentChoice >= ionData.length) currentChoice = 0;
    });
  }

  void reset() {
    setState(() {
      currentChoice = 0;
      ionData = [...widget.ionDataOG];
    });
  }

  //TODO: fix the state issue, Text->Text or Ion->Ion

  Text buildIonGrid(Map e) {
    return Text(e.values.single);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MediaQuery.of(context).orientation == Orientation.landscape
          ? null
          : AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.black,
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            children: [
              ...ionData.map(
                (e) => Center(
                  child: Math.tex(e.values.single),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 80,
            child: ionData.isEmpty
                ? Container(
                    child: Center(
                      child: Math.tex(
                        r"\color{#FF11BB}complete",
                        textScaleFactor: 4,
                      ),
                    ),
                  )
                : ChemCard(
                    ion: ionData[currentChoice].keys.single,
                    text: ionData[currentChoice].values.single,
                  ),
          ),
          Flexible(
            flex: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeatureButton(
                  icon: FontAwesomeIcons.sadTear,
                  whatIDo: wrongAnswer,
                  text: "wrong",
                ),
                FeatureButton(
                  icon: FontAwesomeIcons.check,
                  whatIDo: () => correctAnswer(currentChoice),
                  text: "right",
                ),
                FeatureButton(
                  icon: Icons.shuffle,
                  whatIDo: () {
                    setState(() {
                      ionData.shuffle();
                    });
                  },
                  text: "shuffle",
                ),
                FeatureButton(
                  icon: Icons.refresh,
                  whatIDo: reset,
                  text: "reset",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
