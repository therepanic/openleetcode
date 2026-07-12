class Solution {
    public int bagOfTokensScore(int[] tokens, int power) {
        java.util.Arrays.sort(tokens);
        int n = tokens.length;
        int l = 0;
        int curr = 0;
        
        while (l < n && tokens[l] <= power) {
            power -= tokens[l];
            l++;
            curr++;
        }
        
        int r = n - 1;
        int res = curr;
        
        while (l < r && curr > 0) {
            power += tokens[r];
            curr--;
            r--;
            
            while (l <= r && tokens[l] <= power) {
                power -= tokens[l];
                l++;
                curr++;
            }
            res = Math.max(res, curr);
        }
        
        return res;
    }
}
