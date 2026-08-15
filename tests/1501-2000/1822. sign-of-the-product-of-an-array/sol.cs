public class Solution {
    public int ArraySign(int[] nums) {
        foreach (int num in nums) {
            if (num == 0) return 0;
        }
        int negatives = 0;
        foreach (int num in nums) if (num < 0) negatives++;
        return negatives % 2 == 0 ? 1 : -1;
    }
}
