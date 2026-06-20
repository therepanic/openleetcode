class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        vector<int> res;
        deque<int> q;
        for (int idx = 0; idx < nums.size(); idx++) {
            int num = nums[idx];
            while (!q.empty() && q.back() < num) {
                q.pop_back();
            }
            q.push_back(num);
            if (idx >= k && nums[idx - k] == q.front()) {
                q.pop_front();
            }
            if (idx >= k - 1) {
                res.push_back(q.front());
            }
        }
        return res;
    }
};
