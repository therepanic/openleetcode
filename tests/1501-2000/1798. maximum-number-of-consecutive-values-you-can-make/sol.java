class Solution {
    public int getMaximumConsecutive(int[] coins) {
        Arrays.sort(coins);
        int maxConsecutive = 0;
        
        for (int coin : coins) {
            if (coin > maxConsecutive + 1) break;
            maxConsecutive += coin;
        }
        
        return maxConsecutive + 1;
    }
}
