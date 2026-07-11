class Solution {
  double mincostToHireWorkers(List<int> quality, List<int> wage, int k) {
    int n = quality.length;
    List<List<double>> workers = [];
    for (int i = 0; i < n; i++) {
      workers.add([wage[i] / quality[i], quality[i].toDouble()]);
    }
    workers.sort((a, b) => a[0].compareTo(b[0]));

    double minCost = double.infinity;
    int currentQualitySum = 0;
    final maxHeap = <int>[];

    for (var w in workers) {
      double ratio = w[0];
      int q = w[1].toInt();
      
      currentQualitySum += q;
      maxHeap.add(q);
      maxHeap.sort((a, b) => b.compareTo(a));
      
      if (maxHeap.length > k) {
        currentQualitySum -= maxHeap.removeAt(0);
      }
      
      if (maxHeap.length == k) {
        minCost = minCost < (ratio * currentQualitySum) ? minCost : (ratio * currentQualitySum);
      }
    }

    return minCost;
  }
}
