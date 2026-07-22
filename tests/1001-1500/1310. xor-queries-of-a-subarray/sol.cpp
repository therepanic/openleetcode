class Solution {
public:
    vector<int> xorQueries(vector<int>& arr, vector<vector<int>>& queries) {
        int n = arr.size();
        vector<int> prefix(n + 1, 0);
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] ^ arr[i];
        }
        vector<int> ans;
        ans.reserve(queries.size());
        for (auto& q : queries) {
            int a = q[0], b = q[1];
            ans.push_back(prefix[b + 1] ^ prefix[a]);
        }
        return ans;
    }
};
