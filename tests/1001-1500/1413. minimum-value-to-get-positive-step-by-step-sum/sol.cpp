class Solution {
public:
    int minStartValue(vector<int>& nums) {
        int curr = 0, ans = 0;
        for (int i : nums) {
            curr += i;
            if (curr < ans) {
                ans = curr;
            }
        }
        return max(ans, 1 - ans);
    }
};
