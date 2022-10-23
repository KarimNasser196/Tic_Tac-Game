import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension containsAll on List {
  containsall(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void playgame(int index, String activeplayer) {
    if (activeplayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  String checkWinner() {
    String winner = 'x';
    if (Player.playerX.containsall(0, 1, 2) ||
        Player.playerX.containsall(3, 4, 5) ||
        Player.playerX.containsall(6, 7, 8) ||
        Player.playerX.containsall(0, 3, 6) ||
        Player.playerX.containsall(1, 4, 7) ||
        Player.playerX.containsall(2, 5, 8) ||
        Player.playerX.containsall(0, 4, 8) ||
        Player.playerX.containsall(2, 4, 6)) {
      winner = "X";
    } else if (Player.playerO.containsall(0, 1, 2) ||
        Player.playerO.containsall(3, 4, 5) ||
        Player.playerO.containsall(6, 7, 8) ||
        Player.playerO.containsall(0, 3, 6) ||
        Player.playerO.containsall(1, 4, 7) ||
        Player.playerO.containsall(2, 5, 8) ||
        Player.playerO.containsall(0, 4, 8) ||
        Player.playerO.containsall(2, 4, 6)) {
      winner = "O";
    } else {
      winner = '';
    }
    return winner;
  }

  Future autoPlay(activeplayer) async {
    int indexx = 0;
    List<int> emptycell = [];
    for (var i = 0; i < 10; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptycell.add(i);
      }
    }
    //start_center
    if (Player.playerO.containsall(0, 1) && emptycell.contains(2)) {
      indexx = 2;
    } else if (Player.playerO.containsall(3, 4) && emptycell.contains(5)) {
      indexx = 5;
    } else if (Player.playerO.containsall(6, 7) && emptycell.contains(8)) {
      indexx = 8;
    } else if (Player.playerO.containsall(0, 3) && emptycell.contains(6)) {
      indexx = 6;
    } else if (Player.playerO.containsall(1, 4) && emptycell.contains(7)) {
      indexx = 7;
    } else if (Player.playerO.containsall(2, 5) && emptycell.contains(8)) {
      indexx = 8;
    } else if (Player.playerO.containsall(0, 4) && emptycell.contains(8)) {
      indexx = 8;
    } else if (Player.playerO.containsall(2, 4) && emptycell.contains(6)) {
      indexx = 6;
    } else if (Player.playerO.containsall(0, 2) && emptycell.contains(1)) {
     indexx = 1;
   } else if (Player.playerO.containsall(3, 5) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerO.containsall(6, 8) && emptycell.contains(7)) {
      indexx = 7;
    } else if (Player.playerO.containsall(0, 6) && emptycell.contains(3)) {
      indexx = 3;
    } else if (Player.playerO.containsall(1, 7) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerO.containsall(2, 8) && emptycell.contains(5)) {
      indexx = 5;
    } else if (Player.playerO.containsall(0, 8) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerO.containsall(2, 6) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerO.containsall(1, 2) && emptycell.contains(0)) {
      indexx = 0;
    } else if (Player.playerO.containsall(4, 5) && emptycell.contains(3)) {
      indexx = 3;
    } else if (Player.playerO.containsall(7, 8) && emptycell.contains(6)) {
      indexx = 6;
    } else if (Player.playerO.containsall(3, 6) && emptycell.contains(0)) {
      indexx = 0;
    } else if (Player.playerO.containsall(4, 7) && emptycell.contains(1)) {
      indexx = 1;
    } else if (Player.playerO.containsall(5, 8) && emptycell.contains(2)) {
      indexx = 2;
    } else if (Player.playerO.containsall(4, 8) && emptycell.contains(0)) {
      indexx = 0;
    } else if (Player.playerO.containsall(4, 6) && emptycell.contains(2)) {
      indexx = 2;
    } else if (Player.playerX.containsall(0, 1) && emptycell.contains(2)) {
     indexx = 2;
   } else if (Player.playerX.containsall(3, 4) && emptycell.contains(5)) {
      indexx = 5;
    } else if (Player.playerX.containsall(6, 7) && emptycell.contains(8)) {
      indexx = 8;
    } else if (Player.playerX.containsall(0, 3) && emptycell.contains(6)) {
      indexx = 6;
    } else if (Player.playerX.containsall(1, 4) && emptycell.contains(7)) {
      indexx = 7;
    } else if (Player.playerX.containsall(2, 5) && emptycell.contains(8)) {
      indexx = 8;
    } else if (Player.playerX.containsall(0, 4) && emptycell.contains(8)) {
      indexx = 8;
    } else if (Player.playerX.containsall(2, 4) && emptycell.contains(6)) {
      indexx = 6;
    } else if (Player.playerX.containsall(0, 2) && emptycell.contains(1)) {
      indexx = 1;
    } else if (Player.playerX.containsall(3, 5) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerX.containsall(6, 8) && emptycell.contains(7)) {
      indexx = 7;
    } else if (Player.playerX.containsall(0, 6) && emptycell.contains(3)) {
      indexx = 3;
    } else if (Player.playerX.containsall(1, 7) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerX.containsall(2, 8) && emptycell.contains(5)) {
      indexx = 5;
    } else if (Player.playerX.containsall(0, 8) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerX.containsall(2, 6) && emptycell.contains(4)) {
      indexx = 4;
    } else if (Player.playerX.containsall(1, 2) && emptycell.contains(0)) {
      indexx = 0;
    } else if (Player.playerX.containsall(4, 5) && emptycell.contains(3)) {
      indexx = 3;
    } else if (Player.playerX.containsall(7, 8) && emptycell.contains(6)) {
      indexx = 6;
    } else if (Player.playerX.containsall(3, 6) && emptycell.contains(0)) {
      indexx = 0;
    } else if (Player.playerX.containsall(4, 7) && emptycell.contains(1)) {
      indexx = 1;
    } else if (Player.playerX.containsall(5, 8) && emptycell.contains(2)) {
      indexx = 2;
    } else if (Player.playerX.containsall(4, 8) && emptycell.contains(0)) {
      indexx = 0;
    } else if (Player.playerX.containsall(4, 6) && emptycell.contains(2)) {
      indexx = 2;
    } else {
      Random random = Random();
      int randomindex = random.nextInt(emptycell.length);
      indexx = emptycell[randomindex];
    }

    playgame(indexx, activeplayer);
  }
}
