import 'package:flutter/material.dart';

import 'package:tic_tac/game_logic.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String activeplayer = 'X';
  bool gameover = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  children: [
                    ...firstblock(),
                    Grid(context),
                    const Text(
                      "This game is developed by Karim Nasser",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ...secondblock()
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          ...firstblock(),
                          const Divider(),
                          ...secondblock()
                        ])),
                    Grid(context),
                  ],
                )),
    );
  }

  Expanded Grid(BuildContext context) {
    return Expanded(
        child: GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.0,
      children: List.generate(
          9,
          (index) => InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: gameover
                    ? null
                    : () {
                        Ontap(index);
                      },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      Player.playerX.contains(index)
                          ? 'X'
                          : Player.playerO.contains(index)
                              ? 'O'
                              : '',
                      style: TextStyle(
                          color: Player.playerX.contains(index)
                              ? Colors.blue
                              : Colors.pink,
                          fontSize: 52),
                    ),
                  ),
                ),
              )),
    ));
  }

  Ontap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playgame(index, activeplayer);
      updatestate();
      if (!isSwitched && !gameover) {
        await game.autoPlay(activeplayer);
        updatestate();
      }
    }
  }

  void updatestate() {
    return setState(() {
      activeplayer = activeplayer == 'X' ? 'O' : 'X';
      turn++;
      String winnerplayer = game.checkWinner();
      if (winnerplayer != '') {
        gameover = true;
        result = "$winnerplayer is the winner";
      } else if (!gameover && turn == 9) {
        result = "DRAW";
      }
    });
  }

  List<Widget> firstblock() {
    return [
      SwitchListTile.adaptive(
          title: const Text(
            "Switch to play with friends",
            softWrap: true,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          }),
      Text(
        'It\'s $activeplayer turn'.toUpperCase(),
        style: const TextStyle(color: Colors.white70, fontSize: 52),
        textAlign: TextAlign.center,
      ),
    ];
  }

  secondblock() {
    return [
      Text(
        result,
        style: const TextStyle(color: Colors.white, fontSize: 42),
        textAlign: TextAlign.center,
      ),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            Player.playerX = [];
            Player.playerO = [];
            activeplayer = 'X';
            gameover = false;
            turn = 0;
            result = '';
          });
        },
        label: const Text("Replay"),
        icon: const Icon(
          Icons.replay,
          size: 35,
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).splashColor)),
      )
    ];
  }
}
