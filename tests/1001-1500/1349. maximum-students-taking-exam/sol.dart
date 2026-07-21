class Solution {
  int maxStudents(List<List<String>> seats) {
    int m = seats.length;
    int n = seats[0].length;
    List<int> available = [];
    for (var row in seats) {
      int mask = 0;
      for (int col = 0; col < n; col++) {
        if (row[col] == ".") {
          mask |= 1 << col;
        }
      }
      available.add(mask);
    }

    List<int> validMasks = [];
    for (int mask = 0; mask < (1 << n); mask++) {
      if ((mask & (mask << 1)) == 0) {
        validMasks.add(mask);
      }
    }

    Map<int, int> dp = {0: 0};
    for (int row = 0; row < m; row++) {
      Map<int, int> nextDp = {};
      for (var current in validMasks) {
        if ((current & ~available[row]) != 0) continue;
        int count = current.toRadixString(2).split('').where((c) => c == '1').length;
        dp.forEach((previous, total) {
          if ((current & ((previous << 1) | (previous >> 1))) != 0) return;
          nextDp[current] = nextDp.containsKey(current)
              ? max(nextDp[current]!, total + count)
              : total + count;
        });
      }
      dp = nextDp;
    }

    if (dp.isEmpty) return 0;
    return dp.values.reduce((a, b) => a > b ? a : b);
  }

  int max(int a, int b) => a > b ? a : b;
}
