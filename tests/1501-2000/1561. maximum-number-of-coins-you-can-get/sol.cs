public class Solution {
    public int MaxCoins(int[] piles) {
        Array.Sort(piles);
        int l = 0;
        int r = piles.Length;
        int count = 0;
        for (int i = 0; i < piles.Length/3; i++) {
            count += piles[r-2];
            l += 1;
            r -= 2;
        }
        return count;
    }
}
