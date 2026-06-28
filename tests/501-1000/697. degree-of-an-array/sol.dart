class Solution {
  int findShortestSubArray(List<int> nums) {
    Map<int, int> left = {};
    Map<int, int> right = {};
    Map<int, int> count = {};
    
    for (int i = 0; i < nums.length; i++) {
      int x = nums[i];
      if (!left.containsKey(x)) {
        left[x] = i;
      }
      right[x] = i;
      count[x] = (count[x] ?? 0) + 1;
    }
    
    int ans = nums.length;
    int degree = 0;
    for (int c in count.values) {
      if (c > degree) {
        degree = c;
      }
    }
    
    for (int x in count.keys) {
      if (count[x] == degree) {
        int len = right[x]! - left[x]! + 1;
        if (len < ans) {
          ans = len;
        }
      }
    }
    
    return ans;
  }
}
