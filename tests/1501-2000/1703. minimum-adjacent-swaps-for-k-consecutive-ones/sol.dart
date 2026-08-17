class Solution {
  int minMoves(List<int> nums, int k) {
    List<int> idx = [];
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 1) idx.add(i);
    }
    int n = idx.length;
    List<int> a = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      a[i] = idx[i] - i;
    }
    List<int> prefix = List.filled(n, 0);
    if (n > 0) {
      prefix[0] = a[0];
      for (int i = 1; i < n; i++) {
        prefix[i] = prefix[i-1] + a[i];
      }
    }
    int ans = 1 << 60;
    int l = 0;
    for (int r = 0; r < n; r++) {
      while (r - l + 1 > k) {
        l++;
      }
      if (r - l + 1 == k) {
        int mid = (l + r) ~/ 2;
        int med = a[mid];
        int leftSum = prefix[mid] - (l > 0 ? prefix[l-1] : 0);
        int rightSum = prefix[r] - prefix[mid];
        int cost = (med * (mid - l + 1) - leftSum) + (rightSum - med * (r - mid));
        if (cost < ans) {
          ans = cost;
        }
      }
    }
    return ans;
  }
}
