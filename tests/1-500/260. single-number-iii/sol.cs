public class Solution {
    public int[] SingleNumber(int[] nums) {
        int x = 0;
        foreach (int n in nums) {
            x ^= n;
        }

        long bit = (long)x & -(long)x;
        int a = 0;
        int b = 0;
        foreach (int n in nums) {
            if ((n & bit) != 0) {
                a ^= n;
            } else {
                b ^= n;
            }
        }

        return new int[] {a, b};
    }
}
