class Solution {
public:
    int sumOfFlooredPairs(vector<int>& nums) {
        const int MOD = 1'000'000'007;
        int maxi = 100'001;
        int maxVal = 0;
        for (int num : nums) maxVal = max(maxVal, num);
        int size = 2 * maxi + 1;
        vector<int> freq(size, 0);
        for (int num : nums) freq[num]++;
        for (int i = 1; i < size; i++) freq[i] += freq[i-1];
        
        long long total = 0;
        for (int num = 1; num <= maxVal; num++) {
            int countNum = freq[num] - freq[num-1];
            if (countNum == 0) continue;
            int floorValue = 1;
            while ((long long)floorValue * num <= maxVal) {
                int left = floorValue * num;
                int right = min((floorValue + 1) * num - 1, maxVal);
                int countInRange = freq[right] - freq[left - 1];
                total = (total + (long long)countNum * floorValue * countInRange) % MOD;
                floorValue++;
            }
        }
        return (int)total;
    }
};
