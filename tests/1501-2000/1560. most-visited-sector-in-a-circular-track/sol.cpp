class Solution {
public:
    vector<int> mostVisited(int n, vector<int>& rounds) {
        int s = rounds[0], e = rounds.back();
        vector<int> ans;
        if (s <= e) {
            for (int i = s; i <= e; ++i) ans.push_back(i);
        } else {
            for (int i = 1; i <= e; ++i) ans.push_back(i);
            for (int i = s; i <= n; ++i) ans.push_back(i);
        }
        return ans;
    }
};
