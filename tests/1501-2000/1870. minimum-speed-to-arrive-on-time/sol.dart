class Solution {
  int minSpeedOnTime(List<int> dist, double hour) {
    if (dist.isEmpty) return -1;
    
    bool canReach(int speed) {
      double total = 0;
      for (int i = 0; i < dist.length - 1; i++) {
        total += (dist[i] + speed - 1) ~/ speed; // integer division
      }
      total += dist[dist.length - 1] / speed;
      return total <= hour;
    }
    
    int low = 1, high = 10000000, ans = -1;
    while (low <= high) {
      int mid = (low + high) ~/ 2;
      if (canReach(mid)) {
        ans = mid;
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }
    return ans;
  }
}
