public class Solution {
    public int MaxProduct(int[] nums) {
        int max1 = 0, max2 = 0;
        foreach (int num in nums) {
            if (num > max1) {
                max2 = max1;
                max1 = num;
            } else if (num > max2) {
                max2 = num;
            }
        }
        return (max1 - 1) * (max2 - 1);
    }
}
