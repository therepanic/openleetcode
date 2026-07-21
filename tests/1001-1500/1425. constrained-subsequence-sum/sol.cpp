class Solution {
public:
    int constrainedSubsetSum(vector<int>& nums, int k) {
        deque<pair<int, int>> q;
        int res = INT_MIN;
        for (int i = 0; i < nums.size(); i++) {
            int num = nums[i];
            int total = q.empty() ? num : num + q.front().second;
            res = max(res, total);
            while (!q.empty() && total >= q.back().second) {
                q.pop_back();
            }
            if (total > 0) {
                q.push_back({i, total});
            }
            if (!q.empty() && q.front().first == i - k) {
                q.pop_front();
            }
        }
        return res;
    }
};
