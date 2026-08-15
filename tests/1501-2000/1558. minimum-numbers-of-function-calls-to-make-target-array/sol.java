class Solution {
    public int minOperations(int[] nums) {
        int sumBits = 0;
        int maxNum = 0;
        for (int num : nums) {
            sumBits += Integer.bitCount(num);
            if (num > maxNum) {
                maxNum = num;
            }
        }
        int doubling = maxNum > 0 ? Integer.toBinaryString(maxNum).length() - 1 : 0;
        return sumBits + doubling;
    }
}
