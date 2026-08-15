class Solution {
  int countPairs(List<int> nums, int low, int high) {
    int countLess(int bound) {
      if (bound <= 0) return 0;
      final child = <List<int>>[
        [-1, -1]
      ];
      final count = <int>[0];
      var total = 0;
      for (final value in nums) {
        var node = 0;
        for (var bit = 30; bit >= 0; bit--) {
          final v = (value >> bit) & 1;
          final b = (bound >> bit) & 1;
          if (b == 1) {
            final same = child[node][v];
            if (same != -1) total += count[same];
            node = child[node][1 - v];
            if (node == -1) break;
          } else {
            node = child[node][v];
            if (node == -1) break;
          }
        }
        node = 0;
        for (var bit = 30; bit >= 0; bit--) {
          final v = (value >> bit) & 1;
          var next = child[node][v];
          if (next == -1) {
            next = child.length;
            child[node][v] = next;
            child.add([-1, -1]);
            count.add(0);
          }
          node = next;
          count[node]++;
        }
      }
      return total;
    }

    return countLess(high + 1) - countLess(low);
  }
}
