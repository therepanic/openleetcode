class Solution {
public:
    int arrayNesting(vector<int>& nums) {
        int maxCount = 0;
        
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] == -1) {
                continue;
            }
            
            int currentCount = 0;
            int start = i;
            
            while (nums[start] != -1) {
                int nextNode = nums[start];
                nums[start] = -1;
                start = nextNode;
                currentCount++;
            }
            
            if (currentCount > maxCount) {
                maxCount = currentCount;
            }
        }
        
        return maxCount;
    }
};
