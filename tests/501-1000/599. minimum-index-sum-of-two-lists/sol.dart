class Solution {
  List<String> findRestaurant(List<String> list1, List<String> list2) {
    final pos = <String, int>{};
    for (int i = 0; i < list1.length; i++) {
      pos[list1[i]] = i;
    }
    int best = 1 << 30;
    final ans = <String>[];
    for (int i = 0; i < list2.length; i++) {
      final j = pos[list2[i]];
      if (j != null) {
        final sum = j + i;
        if (sum < best) {
          best = sum;
          ans
            ..clear()
            ..add(list2[i]);
        } else if (sum == best) {
          ans.add(list2[i]);
        }
      }
    }
    return ans;
  }
}
