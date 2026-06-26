class Solution {
public:
    vector<vector<int>> outerTrees(vector<vector<int>>& trees) {
        if (trees.size() == 1) {
            return trees;
        }

        auto cross = [](vector<int>& o, vector<int>& a, vector<int>& b) {
            return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);
        };

        sort(trees.begin(), trees.end(), [](vector<int>& a, vector<int>& b) {
            return a[0] == b[0] ? a[1] < b[1] : a[0] < b[0];
        });

        vector<vector<int>> lower;
        for (auto& p : trees) {
            while (lower.size() >= 2 && cross(lower[lower.size() - 2], lower[lower.size() - 1], p) < 0) {
                lower.pop_back();
            }
            lower.push_back(p);
        }

        vector<vector<int>> upper;
        for (int i = trees.size() - 1; i >= 0; i--) {
            auto& p = trees[i];
            while (upper.size() >= 2 && cross(upper[upper.size() - 2], upper[upper.size() - 1], p) < 0) {
                upper.pop_back();
            }
            upper.push_back(p);
        }

        lower.pop_back();
        upper.pop_back();
        lower.insert(lower.end(), upper.begin(), upper.end());

        set<string> seen;
        vector<vector<int>> result;
        for (auto& p : lower) {
            string key = to_string(p[0]) + "," + to_string(p[1]);
            if (seen.find(key) == seen.end()) {
                seen.insert(key);
                result.push_back(p);
            }
        }

        return result;
    }
};
