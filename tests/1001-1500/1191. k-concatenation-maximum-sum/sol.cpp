class Solution {
public:
    int kConcatenationMaxSum(vector<int>& arr, int k) {
        const int MOD = 1000000007;
        
        auto kadanes = [](const vector<int>& nums) -> long long {
            long long best = 0;
            long long total = 0;
            for (int x : nums) {
                total += x;
                if (total < 0) total = 0;
                best = max(best, total);
            }
            return best;
        };
        
        if (k <= 3) {
            vector<int> extended;
            extended.reserve(arr.size() * k);
            for (int i = 0; i < k; ++i) {
                extended.insert(extended.end(), arr.begin(), arr.end());
            }
            return (int)(kadanes(extended) % MOD);
        }
        
        long long sum = 0;
        for (int x : arr) sum += x;
        long long s = max(0LL, sum * (k - 1)) % MOD;
        
        vector<int> doubleArr;
        doubleArr.reserve(arr.size() * 2);
        doubleArr.insert(doubleArr.end(), arr.begin(), arr.end());
        doubleArr.insert(doubleArr.end(), arr.begin(), arr.end());
        
        return (int)(max(s + kadanes(arr), kadanes(doubleArr)) % MOD);
    }
};
