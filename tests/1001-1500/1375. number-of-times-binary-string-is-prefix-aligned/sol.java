class Solution {
    public int numTimesAllBlue(int[] flips) {
        int res = 0;
        int maxFlips = 0;
        
        for (int i = 0; i < flips.length; i++) {
            maxFlips = Math.max(maxFlips, flips[i]);
            if (maxFlips == i + 1) {
                res++;
            }
        }
        
        return res;
    }
}
