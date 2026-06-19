import 'dart:collection';

class Solution {
  String removeSame(String s, int i) {
    if (i < 0) return s;
    int left = i, right = i;
    while (left > 0 && s[left - 1] == s[i]) left--;
    while (right + 1 < s.length && s[right + 1] == s[i]) right++;
    int length = right - left + 1;
    if (length >= 3) {
      String newS = s.substring(0, left) + s.substring(right + 1);
      return removeSame(newS, left - 1);
    }
    return s;
  }

  int findMinStep(String board, String hand) {
    List<String> handChars = hand.split('');
    handChars.sort();
    hand = handChars.join('');

    Queue<List<dynamic>> q = Queue();
    Set<String> visited = {};
    q.add([board, hand, 0]);
    visited.add('$board#$hand');

    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      String currBoard = cur[0];
      String currHand = cur[1];
      int step = cur[2];

      for (int i = 0; i <= currBoard.length; i++) {
        for (int j = 0; j < currHand.length; j++) {
          if (j > 0 && currHand[j] == currHand[j - 1]) continue;
          if (i > 0 && currBoard[i - 1] == currHand[j]) continue;

          bool pick = false;
          if (i < currBoard.length && currBoard[i] == currHand[j]) pick = true;
          if (i > 0 &&
              i < currBoard.length &&
              currBoard[i - 1] == currBoard[i] &&
              currBoard[i] != currHand[j]) pick = true;

          if (pick) {
            String newBoard = removeSame(
                currBoard.substring(0, i) + currHand[j] + currBoard.substring(i), i);
            String newHand = currHand.substring(0, j) + currHand.substring(j + 1);
            if (newBoard.isEmpty) return step + 1;
            String key = '$newBoard#$newHand';
            if (!visited.contains(key)) {
              visited.add(key);
              q.add([newBoard, newHand, step + 1]);
            }
          }
        }
      }
    }
    return -1;
  }
}
