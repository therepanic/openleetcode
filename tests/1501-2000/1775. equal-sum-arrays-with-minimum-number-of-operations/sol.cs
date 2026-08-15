public class Solution {
    public int MinOperations(int[] nums1, int[] nums2) {
        int x = nums1.Sum();
        int y = nums2.Sum();
        if (x == y) return 0;
        if (x < y) {
            if (6*nums1.Length < nums2.Length) return -1;
            var gains = nums1.Select(v => 6-v).Concat(nums2.Select(v => v-1)).ToList();
            gains.Sort((a,b) => b.CompareTo(a));
            int diff = y - x;
            int ops = 0;
            foreach (int g in gains) {
                if (diff <= 0) break;
                diff -= g;
                ops++;
            }
            return diff <= 0 ? ops : -1;
        } else {
            if (6*nums2.Length < nums1.Length) return -1;
            var gains = nums1.Select(v => v-1).Concat(nums2.Select(v => 6-v)).ToList();
            gains.Sort((a,b) => b.CompareTo(a));
            int diff = x - y;
            int ops = 0;
            foreach (int g in gains) {
                if (diff <= 0) break;
                diff -= g;
                ops++;
            }
            return diff <= 0 ? ops : -1;
        }
    }
}
