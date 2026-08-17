class Solution {
  int maxHeight(List<List<int>> cuboids) {
    for (final cuboid in cuboids) {
      cuboid.sort();
    }
    cuboids.sort((a, b) {
      for (var i = 0; i < 3; i++) {
        final comparison = a[i].compareTo(b[i]);
        if (comparison != 0) return comparison;
      }
      return 0;
    });
    final dp = List<int>.filled(cuboids.length, 0);
    var answer = 0;
    for (var i = 0; i < cuboids.length; i++) {
      dp[i] = cuboids[i][2];
      for (var j = 0; j < i; j++) {
        if (cuboids[j][0] <= cuboids[i][0] &&
            cuboids[j][1] <= cuboids[i][1] &&
            cuboids[j][2] <= cuboids[i][2]) {
          final candidate = dp[j] + cuboids[i][2];
          if (candidate > dp[i]) dp[i] = candidate;
        }
      }
      if (dp[i] > answer) answer = dp[i];
    }
    return answer;
  }
}
