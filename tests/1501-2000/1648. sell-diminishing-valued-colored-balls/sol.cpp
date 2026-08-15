class Solution {
public:
    int maxProfit(vector<int>& inventory, int orders) {
        int max_val = 0;
        for (int v : inventory) max_val = max(max_val, v);
        long long t = binarySearch(inventory, 0, max_val, orders);
        long long total = 0, sold = 0;
        for (int ball : inventory) {
            if (ball > t) {
                long long cnt = ball - t;
                total += (ball + t + 1) * cnt / 2;
                sold += cnt;
            }
        }
        long long extra = sold - orders;
        long long res = total - extra * (t + 1);
        const long long MOD = 1000000007;
        return (int)((res % MOD + MOD) % MOD);
    }

private:
    long long binarySearch(vector<int>& arr, int left, int right, int target) {
        while (left < right) {
            int mid = (left + right + 1) / 2;
            long long count = 0;
            for (int x : arr) {
                if (x > mid) count += x - mid;
            }
            if (count >= target) left = mid;
            else right = mid - 1;
        }
        return left;
    }
};
