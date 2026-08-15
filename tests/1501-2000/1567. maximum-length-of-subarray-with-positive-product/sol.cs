public class Solution {
    public int GetMaxLen(int[] nums) {
        int posLen = 0, negLen = 0, maxLen = 0;
        foreach (int num in nums) {
            if (num == 0) {
                posLen = 0;
                negLen = 0;
            } else if (num > 0) {
                posLen++;
                negLen = negLen > 0 ? negLen + 1 : 0;
            } else {
                int temp = posLen;
                posLen = negLen > 0 ? negLen + 1 : 0;
                negLen = temp + 1;
            }
            maxLen = Math.Max(maxLen, posLen);
        }
        return maxLen;
    }
}
