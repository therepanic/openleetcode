class Solution {
  int boxDelivering(List<List<int>> boxes, int portsCount, int maxBoxes, int maxWeight) {
    int n = boxes.length;
    List<int> ports = List<int>.filled(n+1, 0);
    List<int> weights = List<int>.filled(n+1, 0);
    for (int i = 0; i < n; i++) {
      ports[i+1] = boxes[i][0];
      weights[i+1] = boxes[i][1];
    }
    List<int> prefixWeights = List<int>.filled(n+1, 0);
    for (int i = 1; i <= n; i++) {
      prefixWeights[i] = prefixWeights[i-1] + weights[i];
    }
    List<int> portsCnt = List<int>.filled(n+2, 0);
    for (int i = 2; i <= n; i++) {
      portsCnt[i] = portsCnt[i-1] + (ports[i] != ports[i-1] ? 1 : 0);
    }
    portsCnt[n+1] = portsCnt[n];
    List<int> dp = List<int>.filled(n+1, 0);
    List<int> queue = [0];
    int left = 0;
    for (int i = 1; i <= n; i++) {
      while (i - left > maxBoxes || prefixWeights[i] - prefixWeights[left] > maxWeight) {
        if (queue.isNotEmpty && queue.first == left) {
          queue.removeAt(0);
        }
        left++;
      }
      dp[i] = 2 + portsCnt[i] + (dp[queue.first] - portsCnt[queue.first+1]);
      int idx = dp[i] - portsCnt[i+1];
      while (queue.isNotEmpty && dp[queue.last] - portsCnt[queue.last+1] >= idx) {
        queue.removeLast();
      }
      queue.add(i);
    }
    return dp[n];
  }
}
