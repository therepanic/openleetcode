public class Solution {
    public int MaxArea(int h, int w, int[] horizontalCuts, int[] verticalCuts) {
        const int MOD = 1_000_000_007;
        
        Array.Sort(horizontalCuts);
        Array.Sort(verticalCuts);
        
        long maxH = Math.Max(horizontalCuts[0], h - horizontalCuts[horizontalCuts.Length - 1]);
        for (int i = 1; i < horizontalCuts.Length; i++) {
            maxH = Math.Max(maxH, horizontalCuts[i] - horizontalCuts[i - 1]);
        }
        
        long maxV = Math.Max(verticalCuts[0], w - verticalCuts[verticalCuts.Length - 1]);
        for (int i = 1; i < verticalCuts.Length; i++) {
            maxV = Math.Max(maxV, verticalCuts[i] - verticalCuts[i - 1]);
        }
        
        return (int)((maxH * maxV) % MOD);
    }
}
