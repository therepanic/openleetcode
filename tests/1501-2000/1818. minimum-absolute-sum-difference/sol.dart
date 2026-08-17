class Solution {
  int minAbsoluteSumDiff(List<int> nums1, List<int> nums2) {
    const int MOD = 1000000007;
    int n = nums1.length;
    List<int> sortedNums1 = List.from(nums1)..sort();
    int total = 0;
    int maxReduction = 0;
    
    for (int i = 0; i < n; i++) {
      int a = nums1[i];
      int b = nums2[i];
      int currDiff = (a - b).abs();
      total += currDiff;
      
      int idx = _lowerBound(sortedNums1, b);
      
      if (idx < n) {
        maxReduction = _max(maxReduction, currDiff - (sortedNums1[idx] - b).abs());
      }
      if (idx > 0) {
        maxReduction = _max(maxReduction, currDiff - (sortedNums1[idx - 1] - b).abs());
      }
    }
    
    return (total - maxReduction) % MOD;
  }
  
  int _lowerBound(List<int> arr, int target) {
    int low = 0, high = arr.length;
    while (low < high) {
      int mid = (low + high) ~/ 2;
      if (arr[mid] < target) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    return low;
  }
  
  int _max(int a, int b) => a > b ? a : b;
}
