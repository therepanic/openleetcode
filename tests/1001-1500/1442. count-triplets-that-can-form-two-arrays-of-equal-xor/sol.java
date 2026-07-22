class Solution {
    public int countTriplets(int[] arr) {
        int totalCount = 0;
        int prefixXor = 0;
        java.util.Map<Integer, Integer> prefixCount = new java.util.HashMap<>();
        java.util.Map<Integer, Integer> indexSum = new java.util.HashMap<>();
        prefixCount.put(0, 1);
        indexSum.put(0, 0);
        for (int k = 1; k <= arr.length; k++) {
            prefixXor ^= arr[k - 1];
            if (prefixCount.containsKey(prefixXor)) {
                totalCount += prefixCount.get(prefixXor) * (k - 1) - indexSum.get(prefixXor);
            } else {
                prefixCount.put(prefixXor, 0);
                indexSum.put(prefixXor, 0);
            }
            prefixCount.put(prefixXor, prefixCount.get(prefixXor) + 1);
            indexSum.put(prefixXor, indexSum.get(prefixXor) + k);
        }
        return totalCount;
    }
}
