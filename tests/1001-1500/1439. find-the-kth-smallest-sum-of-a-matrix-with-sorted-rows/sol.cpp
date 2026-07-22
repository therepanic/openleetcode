class Solution {
public:
    int kthSmallest(vector<vector<int>>& mat, int k) {
        vector<int> sums(mat[0].begin(), mat[0].begin() + min((int)mat[0].size(), k));
        for (int i = 1; i < mat.size(); ++i) {
            vector<int> row = mat[i];
            int limit = min((int)row.size(), k);
            vector<int> next;
            next.reserve(sums.size() * limit);
            for (int a : sums) {
                for (int j = 0; j < limit; ++j) {
                    next.push_back(a + row[j]);
                }
            }
            sort(next.begin(), next.end());
            if (next.size() > k) next.resize(k);
            sums = move(next);
        }
        return sums[k - 1];
    }
};
