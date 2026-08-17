class Solution {
public:
    int closestToTarget(vector<int>& arr, int target) {
        int n = arr.size();
        int LOG = (int)log2(n) + 1;
        vector<vector<int>> st(n, vector<int>(LOG, 0));
        for (int i = 0; i < n; i++) st[i][0] = arr[i];
        for (int j = 1; j < LOG; j++) {
            for (int i = 0; i + (1 << j) <= n; i++) {
                st[i][j] = st[i][j-1] & st[i + (1 << (j-1))][j-1];
            }
        }
        vector<int> logs(n + 1, 0);
        for (int i = 2; i <= n; i++) logs[i] = logs[i / 2] + 1;
        
        int res = INT_MAX;
        for (int l = 0; l < n; l++) {
            int left = l, right = n - 1;
            while (left <= right) {
                int mid = (left + right) / 2;
                int k = logs[mid - l + 1];
                int val = st[l][k] & st[mid - (1 << k) + 1][k];
                res = min(res, abs(val - target));
                if (val >= target) left = mid + 1;
                else right = mid - 1;
            }
        }
        return res;
    }
};
