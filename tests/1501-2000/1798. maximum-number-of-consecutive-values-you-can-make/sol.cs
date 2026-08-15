public class Solution {
    public int GetMaximumConsecutive(int[] coins) {
        Array.Sort(coins);
        int maxConsecutive = 0;
        
        foreach (int coin in coins) {
            if (coin > maxConsecutive + 1) break;
            maxConsecutive += coin;
        }
        
        return maxConsecutive + 1;
    }
}
