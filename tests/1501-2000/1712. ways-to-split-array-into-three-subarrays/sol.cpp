class Solution {
public:
    int waysToSplit(vector<int>& nums) {
        const int MOD = 1000000007;
        int n = nums.size();
        vector<long long> prefix(n);
        prefix[0] = nums[0];
        
        for (int i = 1; i < n; i++) {
            prefix[i] = prefix[i - 1] + nums[i];
        }
        
        long long res = 0;
        for (int i = 0; i < n - 2; i++) {
            long long left = prefix[i];
            int j = lowerBound(prefix, 2 * left, i + 1, n - 1);
            int k = upperBound(prefix, (prefix[n - 1] + left) / 2, j, n - 1);
            if (j < k) {
                res = (res + (k - j)) % MOD;
            }
        }
        return (int)res;
    }
    
private:
    int lowerBound(vector<long long>& arr, long long target, int lo, int hi) {
        int l = lo, h = hi;
        while (l < h) {
            int mid = (l + h) / 2;
            if (arr[mid] < target) {
                l = mid + 1;
            } else {
                h = mid;
            }
        }
        return l;
    }
    
    int upperBound(vector<long long>& arr, long long target, int lo, int hi) {
        int l = lo, h = hi;
        while (l < h) {
            int mid = (l + h) / 2;
            if (arr[mid] <= target) {
                l = mid + 1;
            } else {
                h = mid;
            }
        }
        return l;
    }
};
