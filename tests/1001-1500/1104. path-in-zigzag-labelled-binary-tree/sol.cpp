class Solution {
public:
    vector<int> pathInZigZagTree(int label) {
        vector<int> res;
        int cur = label;
        while (cur > 0) {
            res.push_back(cur);
            int start = 1;
            while (start * 2 <= cur) {
                start *= 2;
            }
            int end = start * 2 - 1;
            cur = (start + end - cur) / 2;
        }
        reverse(res.begin(), res.end());
        return res;
    }
};
