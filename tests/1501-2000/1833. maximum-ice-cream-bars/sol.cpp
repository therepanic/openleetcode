class Solution {
public:
    int maxIceCream(vector<int>& costs, int coins) {
        int xMin = *min_element(costs.begin(), costs.end());
        int xMax = *max_element(costs.begin(), costs.end());
        vector<int> freq(xMax + 1, 0);
        for (int x : costs) {
            freq[x]++;
            xMin = min(xMin, x);
        }
        int cnt = 0;
        for (int x = xMin; x <= xMax; x++) {
            int f = freq[x];
            if (f == 0) continue;
            int buy = min(coins / x, f);
            if (buy == 0) break;
            cnt += buy;
            coins -= buy * x;
        }
        return cnt;
    }
};
