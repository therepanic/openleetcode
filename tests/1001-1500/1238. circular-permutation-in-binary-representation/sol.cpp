class Solution {
public:
    vector<int> circularPermutation(int n, int start) {
        vector<int> result;
        for (int i = 0; i < (1 << n); i++) {
            result.push_back(start ^ (i ^ (i >> 1)));
        }
        return result;
    }
};
