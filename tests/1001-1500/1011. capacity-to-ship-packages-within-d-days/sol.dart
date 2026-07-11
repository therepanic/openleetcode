class Solution {
  int shipWithinDays(List<int> weights, int days) {
    int low = weights.reduce((a, b) => a > b ? a : b);
    int high = weights.reduce((a, b) => a + b);

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      int requiredDays = 1;
      int load = 0;

      for (int weight in weights) {
        if (load + weight > mid) {
          requiredDays++;
          load = weight;
        } else {
          load += weight;
        }
      }

      if (requiredDays <= days) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }
}
