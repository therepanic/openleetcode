class Solution {
public:
    int minMoves(vector<int>& nums, int k) {
        vector<int> idx;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] == 1) idx.push_back(i);
        }
        int n = idx.size();
        vector<long long> a(n);
        for (int i = 0; i < n; i++) {
            a[i] = idx[i] - i;
        }
        vector<long long> prefix(n);
        if (n > 0) {
            prefix[0] = a[0];
            for (int i = 1; i < n; i++) {
                prefix[i] = prefix[i-1] + a[i];
            }
        }
        long long ans = LLONG_MAX;
        int l = 0;
        for (int r = 0; r < n; r++) {
            while (r - l + 1 > k) l++;
            if (r - l + 1 == k) {
                int mid = (l + r) / 2;
                long long med = a[mid];
                long long leftSum = prefix[mid] - (l > 0 ? prefix[l-1] : 0);
                long long rightSum = prefix[r] - prefix[mid];
                long long cost = (med * (mid - l + 1) - leftSum) + (rightSum - med * (r - mid));
                ans = min(ans, cost);
            }
        }
        return (int)ans;
    }
};
