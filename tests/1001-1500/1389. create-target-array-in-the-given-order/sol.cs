public class Solution {
    public int[] CreateTargetArray(int[] nums, int[] index) {
        List<int> target = new List<int>();
        for (int i = 0; i < nums.Length; i++) {
            target.Insert(index[i], nums[i]);
        }
        return target.ToArray();
    }
}
