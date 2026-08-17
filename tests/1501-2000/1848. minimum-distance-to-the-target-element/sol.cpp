class Solution {
public:
    int getMinDistance(vector<int>& nums, int target, int start) {
        if (nums[start] == target) {
            return 0;
        }
        
        int n = nums.size();
        int d = 1;
        
        while (true) {
            if (start - d >= 0 && nums[start - d] == target) {
                return d;
            }
            
            if (start + d < n && nums[start + d] == target) {
                return d;
            }
            
            d++;
        }
    }
};
