class Solution {
  List<int> pathsWithMaxScore(List<String> board) {
    const int mod = 1000000007;
    final int n = board.length;

    List<int> nextScore = List<int>.filled(n + 1, -1);
    List<int> nextWays = List<int>.filled(n + 1, 0);

    for (int i = n - 1; i >= 0; i--) {
      List<int> currScore = List<int>.filled(n + 1, -1);
      List<int> currWays = List<int>.filled(n + 1, 0);
      final String row = board[i];

      for (int j = n - 1; j >= 0; j--) {
        final String cell = row[j];

        if (cell == 'X') {
          continue;
        }

        if (cell == 'S') {
          currScore[j] = 0;
          currWays[j] = 1;
          continue;
        }

        int best = nextScore[j];
        if (currScore[j + 1] > best) {
          best = currScore[j + 1];
        }
        if (nextScore[j + 1] > best) {
          best = nextScore[j + 1];
        }

        if (best == -1) {
          continue;
        }

        int ways = 0;
        if (nextScore[j] == best) {
          ways += nextWays[j];
        }
        if (currScore[j + 1] == best) {
          ways += currWays[j + 1];
        }
        if (nextScore[j + 1] == best) {
          ways += nextWays[j + 1];
        }

        final int value = cell == 'E' ? 0 : cell.codeUnitAt(0) - 48;
        currScore[j] = best + value;
        currWays[j] = ways % mod;
      }

      nextScore = currScore;
      nextWays = currWays;
    }

    if (nextScore[0] == -1) {
      return [0, 0];
    }
    return [nextScore[0], nextWays[0]];
  }
}
