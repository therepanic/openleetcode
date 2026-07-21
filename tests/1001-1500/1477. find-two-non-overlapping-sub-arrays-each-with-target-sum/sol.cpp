class Solution {
public:
    int minSumOfLengths(vector<int>& arr, int target) {
        int n = arr.size();
        vector<int> bestLeft(n, n);
        int minTotal = INT_MAX;
        int left = 0;
        int curr = 0;
        for (int right = 0; right < n; ++right) {
            curr += arr[right];
            while (curr > target) {
                curr -= arr[left];
                ++left;
            }
            if (curr == target) {
                int length = right - left + 1;
                if (right > 0) {
                    bestLeft[right] = min(bestLeft[right - 1], length);
                } else {
                    bestLeft[right] = length;
                }
                if (left > 0 && bestLeft[left - 1] != n) {
                    minTotal = min(minTotal, bestLeft[left - 1] + length);
                }
            } else {
                if (right > 0) {
                    bestLeft[right] = bestLeft[right - 1];
                }
            }
        }
        return minTotal == INT_MAX ? -1 : minTotal;
    }
};
