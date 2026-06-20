class Solution {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        unordered_set<int> windowSet;
        
        for (int i = 0; i < nums.size(); i++) {
            if (i > k) {
                windowSet.erase(nums[i - k - 1]);
            }
            
            if (windowSet.count(nums[i])) {
                return true;
            }
            
            windowSet.insert(nums[i]);
        }
        
        return false;
    }
};
