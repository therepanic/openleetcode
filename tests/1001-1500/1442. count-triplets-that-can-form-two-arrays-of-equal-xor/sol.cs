public class Solution {
    public int CountTriplets(int[] arr) {
        int totalCount = 0;
        int prefixXor = 0;
        var prefixCount = new System.Collections.Generic.Dictionary<int, int>();
        var indexSum = new System.Collections.Generic.Dictionary<int, int>();
        prefixCount[0] = 1;
        indexSum[0] = 0;
        for (int k = 1; k <= arr.Length; k++) {
            prefixXor ^= arr[k - 1];
            if (prefixCount.ContainsKey(prefixXor)) {
                totalCount += prefixCount[prefixXor] * (k - 1) - indexSum[prefixXor];
            } else {
                prefixCount[prefixXor] = 0;
                indexSum[prefixXor] = 0;
            }
            prefixCount[prefixXor]++;
            indexSum[prefixXor] += k;
        }
        return totalCount;
    }
}
