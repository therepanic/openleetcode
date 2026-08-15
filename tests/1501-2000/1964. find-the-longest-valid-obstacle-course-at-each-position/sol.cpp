class Solution {
public:
    vector<int> longestObstacleCourseAtEachPosition(vector<int>& obstacles) {
        vector<int> tails;
        vector<int> res;
        res.reserve(obstacles.size());
        for (int x : obstacles) {
            int idx = upper_bound(tails.begin(), tails.end(), x) - tails.begin();
            res.push_back(idx + 1);
            if (idx == tails.size()) {
                tails.push_back(x);
            } else {
                tails[idx] = x;
            }
        }
        return res;
    }
};
