class Solution {
  int findRadius(List<int> houses, List<int> heaters) {
    houses.sort();
    heaters.sort();
    int radius = 0;
    for (int house in houses) {
      int left = 0, right = heaters.length - 1;
      while (left < right) {
        int mid = (left + right) ~/ 2;
        if (heaters[mid] < house) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }
      int dist = (heaters[left] - house).abs();
      if (left > 0) {
        dist = dist < (heaters[left - 1] - house).abs() ? dist : (heaters[left - 1] - house).abs();
      }
      radius = radius > dist ? radius : dist;
    }
    return radius;
  }
}
