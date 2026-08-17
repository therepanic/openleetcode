class Solution {
    public int sumOfFlooredPairs(int[] nums) {
        final int MOD = 1_000_000_007;
        int maxi = 100_001;
        int maxVal = 0;
        for (int num : nums) maxVal = Math.max(maxVal, num);
        int size = 2 * maxi + 1;
        int[] freq = new int[size];
        for (int num : nums) freq[num]++;
        for (int i = 1; i < size; i++) freq[i] += freq[i-1];
        
        long total = 0;
        for (int num = 1; num <= maxVal; num++) {
            int countNum = freq[num] - freq[num-1];
            if (countNum == 0) continue;
            int floorValue = 1;
            while ((long)floorValue * num <= maxVal) {
                int left = floorValue * num;
                int right = Math.min((floorValue + 1) * num - 1, maxVal);
                int countInRange = freq[right] - freq[left - 1];
                total = (total + (long)countNum * floorValue * countInRange) % MOD;
                floorValue++;
            }
        }
        return (int)total;
    }
}
