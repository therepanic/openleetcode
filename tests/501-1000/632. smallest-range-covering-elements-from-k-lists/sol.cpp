class Solution {
public:
    vector<int> smallestRange(vector<vector<int>>& nums) {
        auto cmp = [](vector<int>& a, vector<int>& b) { return a[0] > b[0]; };
        priority_queue<vector<int>, vector<vector<int>>, decltype(cmp)> heap(cmp);
        int curMax = INT_MIN;
        for (int i = 0; i < nums.size(); i++) {
            int val = nums[i][0];
            heap.push({val, i, 0});
            curMax = max(curMax, val);
        }
        vector<int> small = {INT_MIN, INT_MAX};
        while (!heap.empty()) {
            vector<int> cur = heap.top(); heap.pop();
            int curMin = cur[0], listIdx = cur[1], i = cur[2];
            if ((long long)curMax - curMin < (long long)small[1] - small[0]) {
                small = {curMin, curMax};
            }
            if (i + 1 < nums[listIdx].size()) {
                int nxt = nums[listIdx][i + 1];
                heap.push({nxt, listIdx, i + 1});
                curMax = max(curMax, nxt);
            } else {
                break;
            }
        }
        return small;
    }
};
