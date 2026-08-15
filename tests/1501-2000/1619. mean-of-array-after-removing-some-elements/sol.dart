class Solution {
  double trimMean(List<int> arr) {
    int n = arr.length;
    int per5 = (0.05 * n).toInt();
    arr.sort();
    double sum = 0;
    for (int i = per5; i < n - per5; i++) {
      sum += arr[i];
    }
    return sum / (n - per5 - per5);
  }
}
