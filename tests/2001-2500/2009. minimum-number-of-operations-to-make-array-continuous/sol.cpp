class Solution {
public:
    int minOperations(vector<int>& nums) {
        int length = nums.size();
        int minOps = length;
        vector<int> uniqueNums(nums.begin(), nums.end());
        sort(uniqueNums.begin(), uniqueNums.end());
        uniqueNums.erase(unique(uniqueNums.begin(), uniqueNums.end()), uniqueNums.end());
        int right = 0;
        
        for (int left = 0; left < uniqueNums.size(); left++) {
            while (right < uniqueNums.size() && uniqueNums[right] < uniqueNums[left] + length) {
                right++;
            }
            
            minOps = min(minOps, length - (right - left));
        }
        
        return minOps;
    }
};
