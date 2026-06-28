class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    int n = temperatures.length;
    List<int> ans = List.filled(n, 0);
    List<int> stack = [];

    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && temperatures[i] > temperatures[stack.last]) {
        int prev = stack.removeLast();
        ans[prev] = i - prev;
      }
      stack.add(i);
    }

    return ans;
  }
}
