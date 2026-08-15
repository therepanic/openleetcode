class Solution {
  int stoneGameV(List<int> stoneValue) {
    int n = stoneValue.length;
    List<int> sv = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      sv[i + 1] = sv[i] + stoneValue[i];
    }
    List<List<int>> memo = List.generate(n + 1, (_) => List.filled(n + 1, -1));
    return _helper(sv, 0, n, memo);
  }
  
  int _helper(List<int> sv, int fro, int to, List<List<int>> memo) {
    if (to - fro == 1) return 0;
    if (memo[fro][to] != -1) return memo[fro][to];
    
    int target = (sv[to] + sv[fro]) ~/ 2;
    int lo = fro, hi = to;
    while (lo < hi) {
      int mid = (lo + hi) ~/ 2;
      if (sv[mid] < target) lo = mid + 1; else hi = mid;
    }
    int mid = lo;
    
    int dist = 0;
    int res = 0;
    bool exploreMore = true;
    while (exploreMore) {
      exploreMore = false;
      for (int i in [mid - dist, mid + dist]) {
        if (fro < i && i <= to) {
          int left = sv[i] - sv[fro];
          int right = sv[to] - sv[i];
          if (res ~/ 2 <= left && left <= right) {
            res = res > left + _helper(sv, fro, i, memo) ? res : left + _helper(sv, fro, i, memo);
            exploreMore = true;
          }
          if (left >= right && right >= res ~/ 2) {
            res = res > right + _helper(sv, i, to, memo) ? res : right + _helper(sv, i, to, memo);
            exploreMore = true;
          }
        }
      }
      dist++;
    }
    memo[fro][to] = res;
    return res;
  }
}
