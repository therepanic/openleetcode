class Solution {
  int shortestSubarray(List<int> nums, int k) {
    int n = nums.length;
    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + nums[i];
    }
    
    int best = n + 1;
    var dq = <int>[];
    for (int i = 0; i < prefix.length; i++) {
      while (dq.isNotEmpty && prefix[i] - prefix[dq.first] >= k) {
        best = best < i - dq.first ? best : i - dq.first;
        dq.removeAt(0);
      }
      while (dq.isNotEmpty && prefix[dq.last] >= prefix[i]) {
        dq.removeLast();
      }
      dq.add(i);
    }
    
    return best == n + 1 ? -1 : best;
  }
}
