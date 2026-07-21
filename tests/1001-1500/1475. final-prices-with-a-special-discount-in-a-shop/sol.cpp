class Solution {
public:
    vector<int> finalPrices(vector<int>& prices) {
        vector<int> stack;
        for (int i = 0; i < prices.size(); i++) {
            while (!stack.empty() && prices[stack.back()] >= prices[i]) {
                int index = stack.back();
                stack.pop_back();
                prices[index] -= prices[i];
            }
            stack.push_back(i);
        }
        return prices;
    }
};
