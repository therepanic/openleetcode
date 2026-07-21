public class Solution {
    public int NumTimesAllBlue(int[] flips) {
        int res = 0;
        int maxFlips = 0;
        
        for (int i = 0; i < flips.Length; i++) {
            maxFlips = Math.Max(maxFlips, flips[i]);
            if (maxFlips == i + 1) {
                res++;
            }
        }
        
        return res;
    }
}
