public class Solution {
    public int FourSumCount(int[] nums1, int[] nums2, int[] nums3, int[] nums4) {
        var dict = new Dictionary<int, int>();
        foreach (int a in nums1) {
            foreach (int b in nums2) {
                int sum = a + b;
                if (dict.ContainsKey(sum)) dict[sum]++;
                else dict[sum] = 1;
            }
        }
        int count = 0;
        foreach (int c in nums3) {
            foreach (int d in nums4) {
                int target = -(c + d);
                if (dict.ContainsKey(target)) count += dict[target];
            }
        }
        return count;
    }
}
