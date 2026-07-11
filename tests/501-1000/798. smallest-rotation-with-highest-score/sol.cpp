class Solution {
public:
    int bestRotation(vector<int>& nums) {
        int n = nums.size();
        vector<int> diffs(n + 1, 0);
        for (int i = 0; i < n; i++) {
            int left = ((i - nums[i] + 1) % n + n) % n;
            int right = (i + 1) % n;
            diffs[left]--;
            diffs[right]++;
            if (left > right) {
                diffs[0]--;
            }
        }
        int best = 0;
        int cur = n;
        int maxScore = cur;
        for (int k = 1; k < n; k++) {
            cur += diffs[k];
            if (cur > maxScore) {
                maxScore = cur;
                best = k;
            }
        }
        return best;
    }
};
