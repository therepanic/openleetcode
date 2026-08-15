public class Solution {
    public int TupleSameProduct(int[] nums) {
        var productCount = new Dictionary<int, int>();
        int ans = 0;

        for (int i = 0; i < nums.Length; i++) {
            for (int j = i+1; j < nums.Length; j++) {
                int product = nums[i] * nums[j];
                ans += 8 * productCount.GetValueOrDefault(product);
                productCount[product] = productCount.GetValueOrDefault(product) + 1;
            }
        }

        return ans;
    }
}
