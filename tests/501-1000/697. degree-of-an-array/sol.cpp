class Solution {
public:
    int findShortestSubArray(vector<int>& nums) {
        unordered_map<int, int> left, right, count;
        
        for (int i = 0; i < nums.size(); i++) {
            int x = nums[i];
            if (left.find(x) == left.end()) {
                left[x] = i;
            }
            right[x] = i;
            count[x]++;
        }
        
        int ans = nums.size();
        int degree = 0;
        for (auto& [_, c] : count) {
            degree = max(degree, c);
        }
        
        for (auto& [x, c] : count) {
            if (c == degree) {
                ans = min(ans, right[x] - left[x] + 1);
            }
        }
        
        return ans;
    }
};
