import 'dart:collection';

class Solution {
  int closestCost(List<int> baseCosts, List<int> toppingCosts, int target) {
    List<int> s = [0];
    for (int i in toppingCosts) {
      List<int> ss = [];
      for (int j in s) {
        ss.add(j);
        ss.add(j + i);
        ss.add(j + 2 * i);
      }
      s = ss;
    }
    s.sort();
    int ans = 1000000000;
    int fans = 1000000000;
    int n = s.length;
    for (int i in baseCosts) {
      int j = target - i;
      int x = 0;
      int low = 0, high = n - 1;
      while (low <= high) {
        int mid = (low + high) ~/ 2;
        if (s[mid] < j) {
          x = mid;
          low = mid + 1;
        } else {
          high = mid - 1;
        }
      }
      int ans1 = (j - s[x]).abs();
      if (ans1 < ans) {
        ans = ans1;
        fans = s[x] + i;
      } else if (ans1 == ans) {
        fans = fans < s[x] + i ? fans : s[x] + i;
      }
      if (x + 1 < n) {
        x++;
        ans1 = (j - s[x]).abs();
        if (ans1 < ans) {
          ans = ans1;
          fans = s[x] + i;
        } else if (ans1 == ans) {
          fans = fans < s[x] + i ? fans : s[x] + i;
        }
      }
    }
    return fans;
  }
}
