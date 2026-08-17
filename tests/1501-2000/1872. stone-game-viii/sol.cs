public class Solution {
    private int[] prefix;
    private int[] memo;
    private int n;
    
    public int StoneGameVIII(int[] stones) {
        n = stones.Length;
        prefix = (int[])stones.Clone();
        for (int i = 1; i < n; i++) {
            prefix[i] += prefix[i-1];
        }
        memo = new int[n];
        Array.Fill(memo, int.MinValue);
        return Rec(0);
    }
    
    private int Rec(int i) {
        if (i == n - 2) return prefix[i+1];
        if (memo[i] != int.MinValue) return memo[i];
        int aliceCont = Rec(i+1);
        int aliceDone = prefix[i+1] - Rec(i+1);
        memo[i] = Math.Max(aliceCont, aliceDone);
        return memo[i];
    }
}
