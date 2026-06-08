class Solution {
public:
    vector<int> grayCode(int n) {
        vector<int> res;
        int total = 1 << n;
        res.reserve(total);
        for (int i = 0; i < total; ++i) res.push_back(i ^ (i >> 1));
        return res;
    }
};
