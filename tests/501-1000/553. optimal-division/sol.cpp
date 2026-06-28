class Solution {
public:
    string optimalDivision(vector<int>& nums) {
        string result = to_string(nums[0]);
        
        if (nums.size() == 1) {
            return result;
        }
        
        if (nums.size() == 2) {
            return result + "/" + to_string(nums[1]);
        }
        
        result += "/(" + to_string(nums[1]);
        for (int i = 2; i < nums.size(); i++) {
            result += "/" + to_string(nums[i]);
        }
        
        return result + ")";
    }
};
