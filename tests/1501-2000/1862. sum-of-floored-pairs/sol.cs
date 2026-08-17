public class Solution {
    public int SumOfFlooredPairs(int[] nums) {
        const int MOD = 1_000_000_007;
        int maxi = 100_001;
        int maxVal = nums.Max();
        int size = 2 * maxi + 1;
        int[] freq = new int[size];
        foreach (int num in nums) freq[num]++;
        for (int i = 1; i < size; i++) freq[i] += freq[i-1];
        
        long total = 0;
        for (int num = 1; num <= maxVal; num++) {
            int countNum = freq[num] - freq[num-1];
            if (countNum == 0) continue;
            int floorValue = 1;
            while ((long)floorValue * num <= maxVal) {
                int left = floorValue * num;
                int right = Math.Min((floorValue + 1) * num - 1, maxVal);
                int countInRange = freq[right] - freq[left - 1];
                total = (total + (long)countNum * floorValue * countInRange) % MOD;
                floorValue++;
            }
        }
        return (int)total;
    }
}
