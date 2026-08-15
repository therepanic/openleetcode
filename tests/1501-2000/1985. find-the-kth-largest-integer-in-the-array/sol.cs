public class Solution {
    public string KthLargestNumber(string[] nums, int k) {
        Array.Sort(nums, (a, b) => {
            int byLength = b.Length.CompareTo(a.Length);
            return byLength != 0 ? byLength : string.CompareOrdinal(b, a);
        });
        return nums[k - 1];
    }
}
