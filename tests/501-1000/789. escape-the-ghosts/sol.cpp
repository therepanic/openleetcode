class Solution {
public:
    bool escapeGhosts(vector<vector<int>>& ghosts, vector<int>& target) {
        vector<int> a;
        for (auto& i : ghosts) {
            a.push_back(abs(i[0] - target[0]) + abs(i[1] - target[1]));
        }
        
        int z = abs(target[0] - 0) + abs(target[1] - 0);
        
        bool ans = true;
        for (int i : a) {
            if (i <= z) {
                ans = false;
            }
        }
        
        return ans;
    }
};
