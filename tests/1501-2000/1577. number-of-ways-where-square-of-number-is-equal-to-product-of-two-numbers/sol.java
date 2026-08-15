class Solution {
    public int numTriplets(int[] nums1, int[] nums2) {
        return countPairs(nums1, nums2) + countPairs(nums2, nums1);
    }
    
    private int countPairs(int[] numsA, int[] numsB) {
        Map<Long, Integer> freq = new HashMap<>();
        for (int i = 0; i < numsB.length; i++) {
            for (int j = i + 1; j < numsB.length; j++) {
                long prod = (long) numsB[i] * numsB[j];
                freq.put(prod, freq.getOrDefault(prod, 0) + 1);
            }
        }
        int count = 0;
        for (int num : numsA) {
            count += freq.getOrDefault((long) num * num, 0);
        }
        return count;
    }
}
