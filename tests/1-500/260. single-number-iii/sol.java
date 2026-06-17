class Solution {
    public int[] singleNumber(int[] nums) {
        int x = 0;
        for (int n : nums) {
            x ^= n;
        }

        int bit = x & -x;
        int a = 0;
        int b = 0;
        for (int n : nums) {
            if ((n & bit) != 0) {
                a ^= n;
            } else {
                b ^= n;
            }
        }

        return new int[] {a, b};
    }
}
