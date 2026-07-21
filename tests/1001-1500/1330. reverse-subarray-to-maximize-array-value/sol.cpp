class Solution {
public:
    int maxValueAfterReverse(vector<int>& nums) {
        if (nums.size() < 2) return 0;
        
        int maxMin = INT_MIN;
        int minMin = INT_MAX;
        int S = 0;
        int boundary = INT_MIN;
        
        for (int i = 0; i < nums.size() - 1; i++) {
            int a = nums[i];
            int b = nums[i + 1];
            int distance = abs(a - b);
            boundary = max(boundary, max(abs(nums.back() - a), abs(nums[0] - b)) - distance);
            S += distance;
            minMin = min(max(a, b), minMin);
            maxMin = max(min(a, b), maxMin);
        }
        
        return S + max(2 * (maxMin - minMin), boundary);
    }
};
