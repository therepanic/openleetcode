class Solution {
public:
    int getMaximumConsecutive(vector<int>& coins) {
        sort(coins.begin(), coins.end());
        int maxConsecutive = 0;
        
        for (int coin : coins) {
            if (coin > maxConsecutive + 1) break;
            maxConsecutive += coin;
        }
        
        return maxConsecutive + 1;
    }
};
