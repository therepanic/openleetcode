class Solution {
public:
    int findPairs(vector<int>& nums, int k) {
        if (k < 0) return 0;
        int count = 0;
        unordered_map<int, int> numCounts;
        for (int num : nums) {
            numCounts[num]++;
        }
        for (auto& [num, freq] : numCounts) {
            if (k == 0) {
                if (freq >= 2) count++;
            } else {
                if (numCounts.count(num + k)) count++;
            }
        }
        return count;
    }
};
