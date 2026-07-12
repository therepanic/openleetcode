public class Solution {
    public int NumPairsDivisibleBy60(int[] time) {
        long[] remainders = new long[60];
        foreach (int t in time) {
            remainders[t % 60]++;
        }
        
        long count = 0;
        count += remainders[0] * (remainders[0] - 1) / 2;
        count += remainders[30] * (remainders[30] - 1) / 2;
        
        for (int i = 1; i < 30; i++) {
            count += remainders[i] * remainders[60 - i];
        }
        
        return (int)count;
    }
}
