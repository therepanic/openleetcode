class Solution {
public:
    int closestCost(vector<int>& baseCosts, vector<int>& toppingCosts, int target) {
        vector<int> s = {0};
        for (int i : toppingCosts) {
            vector<int> ss;
            for (int j : s) {
                ss.push_back(j);
                ss.push_back(j+i);
                ss.push_back(j+2*i);
            }
            s = ss;
        }
        sort(s.begin(), s.end());
        int ans = 1000000000;
        int fans = 1000000000;
        int n = s.size();
        for (int i : baseCosts) {
            int j = target - i;
            int x = lower_bound(s.begin(), s.end(), j) - s.begin() - 1;
            x = max(x, 0);
            int ans1 = abs(j - s[x]);
            if (ans1 < ans) {
                ans = ans1;
                fans = s[x] + i;
            } else if (ans1 == ans) {
                fans = min(fans, s[x] + i);
            }
            if (x+1 < n) {
                x++;
                ans1 = abs(j - s[x]);
                if (ans1 < ans) {
                    ans = ans1;
                    fans = s[x] + i;
                } else if (ans1 == ans) {
                    fans = min(fans, s[x] + i);
                }
            }
        }
        return fans;
    }
};
