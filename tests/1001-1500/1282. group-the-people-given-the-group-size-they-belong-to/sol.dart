class Solution {
  List<List<int>> groupThePeople(List<int> groupSizes) {
    List<List<int>> ans = [];
    Map<int, List<int>> mp = {};
    for (int i = 0; i < groupSizes.length; i++) {
      int v = groupSizes[i];
      mp.putIfAbsent(v, () => []);
      mp[v]!.add(i);
      if (mp[v]!.length == v) {
        ans.add(List.from(mp[v]!));
        mp[v] = [];
      }
    }
    return ans;
  }
}
