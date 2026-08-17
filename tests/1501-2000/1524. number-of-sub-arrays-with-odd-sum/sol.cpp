class Solution {
public:
    int numOfSubarrays(vector<int>& arr) {
        long long oddCount = 0;
        long long prefixSum = 0;
        const long long mod = 1000000007LL;
        for (int a : arr) {
            prefixSum += a;
            oddCount += prefixSum % 2;
        }
        oddCount += (arr.size() - oddCount) * oddCount;
        return static_cast<int>(oddCount % mod);
    }
};
