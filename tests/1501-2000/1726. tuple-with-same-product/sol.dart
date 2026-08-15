class Solution {
  int tupleSameProduct(List<int> nums) {
    Map<int, int> productCount = {};
    int ans = 0;

    for (int i = 0; i < nums.length; i++) {
      for (int j = i+1; j < nums.length; j++) {
        int product = nums[i] * nums[j];
        ans += 8 * (productCount[product] ?? 0);
        productCount[product] = (productCount[product] ?? 0) + 1;
      }
    }

    return ans;
  }
}
