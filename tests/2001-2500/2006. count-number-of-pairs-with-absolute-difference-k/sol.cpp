class Solution {
public:
    int countKDifference(vector<int>& nums, int k) {
        unordered_map<int, int> c;
        for (int num : nums) {
            c[num]++;
        }
        int ans = 0;
        for (const auto& entry : c) {
            auto it = c.find(entry.first + k);
            if (it != c.end()) ans += entry.second * it->second;
        }
        return ans;
    }
};
