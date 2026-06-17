public class Solution {
    public int[] Intersection(int[] nums1, int[] nums2) {
        return new HashSet<int>(nums1).Intersect(new HashSet<int>(nums2)).ToArray();
    }
}
