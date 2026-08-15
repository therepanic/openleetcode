class Solution {
  int maxSumRangeQuery(List<int> nums, List<List<int>> requests) {
    List<List<int>> events = [];
    int mod = 1000000007;
    
    for (var req in requests) {
      events.add([req[0], 1]);
      events.add([req[1]+1, -1]);
    }
    
    events.sort((a, b) => a[0].compareTo(b[0]));
    
    int cnt = 0;
    int prev = -1;
    Map<int, int> weight = {};
    
    for (var e in events) {
      if (prev != -1 && cnt != 0) {
        weight[cnt] = (weight[cnt] ?? 0) + (e[0] - prev);
      }
      prev = e[0];
      cnt += e[1];
    }
    
    var sorted = weight.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));
    
    nums.sort((a, b) => b.compareTo(a));
    int ans = 0;
    int idx = 0;
    
    for (var entry in sorted) {
      int wg = entry.key;
      int num = entry.value;
      for (int i = 0; i < num; i++) {
        ans = (ans + nums[idx] * wg) % mod;
        idx++;
      }
    }
    
    return ans;
  }
}
