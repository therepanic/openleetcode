public class Solution {
    public int NumWays(string s) {
        const long MOD = 1000000007;
        long totalOnes = s.Count(c => c == '1');
        
        if (totalOnes == 0) {
            long n = s.Length;
            return (int)(((n - 1) * (n - 2) / 2) % MOD);
        }
        
        if (totalOnes % 3 != 0) return 0;
        
        long onesPerPart = totalOnes / 3;
        long firstSplitWays = 0, secondSplitWays = 0, count = 0;
        
        foreach (char c in s) {
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
