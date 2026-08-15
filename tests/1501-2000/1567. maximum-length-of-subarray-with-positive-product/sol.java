class Solution {
    public int getMaxLen(int[] nums) {
        int posLen = 0, negLen = 0, maxLen = 0;
        for (int num : nums) {
            if (num == 0) {
                posLen = 0;
                negLen = 0;
            } else if (num > 0) {
                posLen++;
                if (negLen > 0) negLen++;
                else negLen = 0;
            } else {
                int temp = posLen;
                if (negLen > 0) posLen = negLen + 1;
                else posLen = 0;
                negLen = temp + 1;
            }
            maxLen = Math.max(maxLen, posLen);
        }
        return maxLen;
    }
}
