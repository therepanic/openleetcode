public class Solution {
    public int NumTriplets(int[] nums1, int[] nums2) {
        int CountPairs(int[] numsA, int[] numsB) {
            var freq = new Dictionary<long, int>();
            for (int i = 0; i < numsB.Length; i++) {
                for (int j = i + 1; j < numsB.Length; j++) {
                    long prod = (long)numsB[i] * numsB[j];
                    freq[prod] = freq.GetValueOrDefault(prod, 0) + 1;
                }
            }
            int count = 0;
            foreach (int num in numsA) {
                long sq = (long)num * num;
                count += freq.GetValueOrDefault(sq, 0);
            }
            return count;
        }
        return CountPairs(nums1, nums2) + CountPairs(nums2, nums1);
    }
}
