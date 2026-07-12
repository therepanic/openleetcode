class Solution {
  int sumSubarrayMins(List<int> arr) {
    const int MOD = 1000000007;
    int n = arr.length;
    List<int> stack = [];
    List<int> res = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && arr[stack.last] > arr[i]) {
        stack.removeLast();
      }
      int j = stack.isNotEmpty ? stack.last : -1;
      res[i] = ((j >= 0 ? res[j] : 0) + (i - j) * arr[i]) % MOD;
      stack.add(i);
    }
    int sum = 0;
    for (int v in res) {
      sum = (sum + v) % MOD;
    }
    return sum;
  }
}
