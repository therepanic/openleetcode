class Solution {
  int waysToSplit(List<int> nums) {
    const MOD = 1000000007;
    int n = nums.length;
    List<int> prefix = List<int>.filled(n, 0);
    prefix[0] = nums[0];
    
    for (int i = 1; i < n; i++) {
      prefix[i] = prefix[i - 1] + nums[i];
    }
    
    int res = 0;
    for (int i = 0; i < n - 2; i++) {
      int left = prefix[i];
      int j = lowerBound(prefix, 2 * left, i + 1, n - 1);
      int k = upperBound(prefix, (prefix[n - 1] + left) ~/ 2, j, n - 1);
      if (j < k) {
        res = (res + (k - j)) % MOD;
      }
    }
    return res;
  }
  
  int lowerBound(List<int> arr, int target, int lo, int hi) {
    int l = lo, h = hi;
    while (l < h) {
      int mid = (l + h) ~/ 2;
      if (arr[mid] < target) {
        l = mid + 1;
      } else {
        h = mid;
      }
    }
    return l;
  }
  
  int upperBound(List<int> arr, int target, int lo, int hi) {
    int l = lo, h = hi;
    while (l < h) {
      int mid = (l + h) ~/ 2;
      if (arr[mid] <= target) {
        l = mid + 1;
      } else {
        h = mid;
      }
    }
    return l;
  }
}
