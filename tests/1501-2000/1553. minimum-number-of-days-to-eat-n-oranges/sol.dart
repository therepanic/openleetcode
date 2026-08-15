class Solution {
  int minDays(int n) {
    int ans = 0;
    List<int> queue = [n];
    Set<int> seen = {};
    while (queue.isNotEmpty) {
      List<int> newq = [];
      for (int x in queue) {
        if (x == 0) return ans;
        seen.add(x);
        if (!seen.contains(x-1)) newq.add(x-1);
        if (x % 2 == 0 && !seen.contains(x/2)) newq.add(x~/2);
        if (x % 3 == 0 && !seen.contains(x/3)) newq.add(x~/3);
      }
      ans++;
      queue = newq;
    }
    return ans;
  }
}
