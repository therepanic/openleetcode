public class Solution {
    public int MinOperations(int[] nums) {
        int sumBits = 0;
        int maxNum = 0;
        foreach (int num in nums) {
            sumBits += Convert.ToString(num, 2).Replace("0", "").Length;
            if (num > maxNum) {
                maxNum = num;
            }
        }
        int doubling = maxNum > 0 ? Convert.ToString(maxNum, 2).Length - 1 : 0;
        return sumBits + doubling;
    }
}
