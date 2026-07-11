class Solution {
public:
    int numEquivDominoPairs(vector<vector<int>>& dominoes) {
        int mpp[100] = {0};
        int count = 0;
        for (auto& d : dominoes) {
            int a = d[0], b = d[1];
            int key = a <= b ? a * 10 + b : b * 10 + a;
            count += mpp[key];
            mpp[key]++;
        }
        return count;
    }
};
