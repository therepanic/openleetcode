class Solution {
public:
    vector<int> getSumAbsoluteDifferences(vector<int>& nums) {
        int n = nums.size();
        vector<int> pref(n);
        pref[0] = nums[0];
        for (int i = 1; i < n; i++) pref[i] = pref[i-1] + nums[i];
        vector<int> ans(n);
        for (int i = 0; i < n; i++) {
            int left = i > 0 ? pref[i-1] : 0;
            int right = pref[n-1] - pref[i];
            ans[i] = right - left + (2*i - n + 1) * nums[i];
        }
        return ans;
    }
};
