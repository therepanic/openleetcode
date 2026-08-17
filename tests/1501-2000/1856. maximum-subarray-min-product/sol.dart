class Solution {
  int maxSumMinProduct(List<int> nums) {
    int n = nums.length;
    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) prefix[i+1] = prefix[i] + nums[i];
    
    List<int> leftBound = List.filled(n, -1);
    List<int> rightBound = List.filled(n, n);
    List<int> stack = [];
    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && nums[stack.last] > nums[i]) {
        rightBound[stack.removeLast()] = i;
      }
      stack.add(i);
    }
    stack.clear();
    for (int i = n-1; i >= 0; i--) {
      while (stack.isNotEmpty && nums[stack.last] > nums[i]) {
        leftBound[stack.removeLast()] = i;
      }
      stack.add(i);
    }
    
    int maxProd = 0;
    for (int i = 0; i < n; i++) {
      int l = leftBound[i], r = rightBound[i];
      int total = prefix[r] - prefix[l+1];
      maxProd = max(maxProd, nums[i] * total);
    }
    return maxProd % 1000000007;
  }
}
