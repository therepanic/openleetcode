class Solution {
public:
    vector<vector<int>> groupThePeople(vector<int>& groupSizes) {
        vector<vector<int>> ans;
        unordered_map<int, vector<int>> mp;
        for (int i = 0; i < groupSizes.size(); ++i) {
            int v = groupSizes[i];
            mp[v].push_back(i);
            if (mp[v].size() == v) {
                ans.push_back(mp[v]);
                mp[v].clear();
            }
        }
        return ans;
    }
};
