class Solution {
public:
    int tallestBillboard(vector<int>& rods) {
        int n = rods.size();
        int mid = (n - 1) >> 1;
        
        vector<pair<int, int>> left, right;
        
        function<void(int, int, int, int, vector<pair<int, int>>&)> gen = 
            [&](int idx, int end, int a, int b, vector<pair<int, int>>& vals) {
            if (idx == end + 1) {
                vals.emplace_back(a - b, b);
                return;
            }
            gen(idx + 1, end, a, b, vals);
            gen(idx + 1, end, a + rods[idx], b, vals);
            gen(idx + 1, end, a, b + rods[idx], vals);
        };
        
        gen(0, mid, 0, 0, left);
        gen(mid + 1, n - 1, 0, 0, right);
        
        sort(left.begin(), left.end(), [](const auto& a, const auto& b) {
            return a.first != b.first ? a.first < b.first : a.second > b.second;
        });
        sort(right.begin(), right.end(), [](const auto& a, const auto& b) {
            return a.first != b.first ? a.first < b.first : a.second > b.second;
        });
        
        vector<int> rightDiffs, rightHeights;
        for (auto& p : right) {
            rightDiffs.push_back(p.first);
            rightHeights.push_back(p.second);
        }
        
        int ans = 0;
        for (auto& [d, b] : left) {
            int target = -d;
            auto it = lower_bound(rightDiffs.begin(), rightDiffs.end(), target);
            int idx = it - rightDiffs.begin();
            if (idx < rightDiffs.size() && rightDiffs[idx] == target) {
                ans = max(ans, b + rightHeights[idx]);
            }
        }
        return ans;
    }
};
