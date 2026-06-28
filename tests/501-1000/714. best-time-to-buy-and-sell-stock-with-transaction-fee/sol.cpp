class Solution {
public:
    int maxProfit(vector<int>& prices, int fee) {
        int hold = -prices[0];
        int cash = 0;

        for (int i = 1; i < prices.size(); i++) {
            cash = max(cash, hold + prices[i] - fee);
            hold = max(hold, cash - prices[i]);
        }

        return cash;
    }
};
