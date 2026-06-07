class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        unordered_set<int> seen(nums.begin(), nums.end());
        int i = 1;
        while (seen.count(i)) {
            i++;
        }
        return i;
    }
};
