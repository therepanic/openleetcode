class Solution {
  int makeArrayIncreasing(List<int> arr1, List<int> arr2) {
    arr2.sort();
    var memo = <String, int>{};
    
    int dfs(int i, int prevMax) {
      if (i == arr1.length) return 0;
      
      final key = '$i,$prevMax';
      if (memo.containsKey(key)) return memo[key]!;
      
      int j = bisectRight(arr2, prevMax);
      
      int ans = 1 << 60;
      if (arr1[i] > prevMax) {
        ans = min(ans, dfs(i + 1, arr1[i]));
      }
      if (j < arr2.length) {
        ans = min(ans, dfs(i + 1, arr2[j]) + 1);
      }
      
      memo[key] = ans;
      return ans;
    }
    
    int ops = dfs(0, -1 << 60);
    return ops >= (1 << 60) ? -1 : ops;
  }
  
  int bisectRight(List<int> arr, int target) {
    int lo = 0, hi = arr.length;
    while (lo < hi) {
      int mid = lo + (hi - lo) ~/ 2;
      if (arr[mid] <= target) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }
}
