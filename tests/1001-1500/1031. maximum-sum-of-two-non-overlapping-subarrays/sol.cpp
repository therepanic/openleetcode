class Solution {
public:
    int maxSumTwoNoOverlap(vector<int>& nums, int firstLen, int secondLen) {
        return max(solve(nums, firstLen, secondLen), solve(nums, secondLen, firstLen));
    }

private:
    int solve(const vector<int>& nums, int firstLen, int secondLen) {
        int n = nums.size();
        vector<int> prefix(n + 1, 0);
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + nums[i];
        }
        int bestA = prefix[firstLen];
        int ans = 0;
        for (int end = firstLen + secondLen; end <= n; end++) {
            bestA = max(bestA, prefix[end - secondLen] - prefix[end - secondLen - firstLen]);
            ans = max(ans, bestA + prefix[end] - prefix[end - secondLen]);
        }
        return ans;
    }
};
