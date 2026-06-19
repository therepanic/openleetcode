class Solution {
    public int arrangeCoins(int n) {
        return (int)((Math.sqrt(8L * n + 1) - 1) / 2);
    }
}
