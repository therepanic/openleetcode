class Solution {
  int numFriendRequests(List<int> ages) {
    List<int> cnt = List.filled(121, 0);
    for (int age in ages) {
      cnt[age]++;
    }
    List<int> pre = List.filled(122, 0);
    for (int i = 0; i < 121; i++) {
      pre[i + 1] = pre[i] + cnt[i];
    }
    int ans = 0;
    for (int age = 15; age < 121; age++) {
      if (cnt[age] > 0) {
        int lower = (age * 0.5 + 7).toInt();
        int total = pre[age + 1] - pre[lower + 1];
        ans += cnt[age] * (total - 1);
      }
    }
    return ans;
  }
}
