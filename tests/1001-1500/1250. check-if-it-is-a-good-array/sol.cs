public class Solution {
    public bool IsGoodArray(int[] nums) {
        int g = nums[0];
        for (int i = 1; i < nums.Length; i++) {
            g = Gcd(g, nums[i]);
        }
        return g == 1;
    }
    
    private int Gcd(int a, int b) {
        while (b != 0) {
            int t = b;
            b = a % b;
            a = t;
        }
        return a;
    }
}
