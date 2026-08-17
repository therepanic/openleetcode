class Solution {
    public int numWays(String s) {
        final int MOD = 1_000_000_007;
        long totalOnes = 0;
        for (char c : s.toCharArray()) {
            if (c == '1') totalOnes++;
        }
        
        if (totalOnes == 0) {
            long n = s.length();
            return (int)(((n - 1) * (n - 2) / 2) % MOD);
        }
        
        if (totalOnes % 3 != 0) return 0;
        
        long onesPerPart = totalOnes / 3;
        long firstSplitWays = 0, secondSplitWays = 0;
        long count = 0;
        
        for (char c : s.toCharArray()) {
            if (c == '1') count++;
            if (count == onesPerPart) {
                firstSplitWays++;
            } else if (count == 2 * onesPerPart) {
                secondSplitWays++;
            }
        }
        
        return (int)((firstSplitWays * secondSplitWays) % MOD);
    }
}
