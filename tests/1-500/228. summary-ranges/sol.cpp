class Solution {
public:
    vector<string> summaryRanges(vector<int>& nums) {
        vector<string> result;
        int i = 0;
        
        while (i < nums.size()) {
            int start = nums[i];
            int j = i;
            while (j + 1 < nums.size() && nums[j + 1] == nums[j] + 1) {
                j++;
            }
            
            if (nums[j] == start) {
                result.push_back(to_string(start));
            } else {
                result.push_back(to_string(start) + "->" + to_string(nums[j]));
            }
            
            i = j + 1;
        }
        
        return result;
    }
};
