class Solution {
public:
    int longestSubarray(vector<int>& nums, int limit) {
        deque<int> maxq, minq;
        int left = 0, max_len = 1;
        for (int right = 0; right < nums.size(); ++right) {
            while (!maxq.empty() && nums[maxq.back()] <= nums[right]) {
                maxq.pop_back();
            }
            maxq.push_back(right);
            while (!minq.empty() && nums[minq.back()] >= nums[right]) {
                minq.pop_back();
            }
            minq.push_back(right);
            while (nums[maxq.front()] - nums[minq.front()] > limit) {
                ++left;
                if (maxq.front() < left) {
                    maxq.pop_front();
                }
                if (minq.front() < left) {
                    minq.pop_front();
                }
            }
            max_len = max(max_len, right - left + 1);
        }
        return max_len;
    }
};
