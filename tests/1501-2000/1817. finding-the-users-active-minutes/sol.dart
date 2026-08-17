class Solution {
  List<int> findingUsersActiveMinutes(List<List<int>> logs, int k) {
    Map<int, Set<int>> mp = {};
    for (var log in logs) {
      mp.putIfAbsent(log[0], () => <int>{}).add(log[1]);
    }
    List<int> ans = List.filled(k, 0);
    for (var set in mp.values) {
      int size = set.length;
      if (size <= k) {
        ans[size - 1]++;
      }
    }
    return ans;
  }
}
