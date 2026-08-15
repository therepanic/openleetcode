public class Solution {
    public int NumOfSubarrays(int[] arr) {
        long oddCount = 0;
        long prefixSum = 0;
        const long mod = 1000000007L;
        foreach (int a in arr) {
            prefixSum += a;
            oddCount += prefixSum % 2;
        }
        oddCount += (arr.Length - oddCount) * oddCount;
        return (int)(oddCount % mod);
    }
}
