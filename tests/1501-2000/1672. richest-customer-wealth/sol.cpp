class Solution {
public:
    int maximumWealth(vector<vector<int>>& accounts) {
        int rich = 0;
        for (auto& i : accounts) {
            int sum = 0;
            for (int j : i) {
                sum += j;
            }
            rich = max(rich, sum);
        }
        return rich;
    }
};
