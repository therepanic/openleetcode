class Solution {
    public int maxCoins(int[] piles) {
        java.util.Arrays.sort(piles);
        int l = 0;
        int r = piles.length;
        int count = 0;
        for (int i = 0; i < piles.length / 3; i++) {
            count += piles[r-2];
            l += 1;
            r -= 2;
        }
        return count;
    }
}
