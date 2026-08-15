class Solution {
    public int numOfSubarrays(int[] arr) {
        long oddCount = 0;
        long prefixSum = 0;
        int mod = 1_000_000_007;
        for (int a : arr) {
            prefixSum += a;
            oddCount += prefixSum % 2;
        }
        oddCount += (arr.length - oddCount) * oddCount;
        return (int)(oddCount % mod);
    }
}
