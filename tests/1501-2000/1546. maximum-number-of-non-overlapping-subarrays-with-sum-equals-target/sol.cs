public class Solution {
    public int MaxNonOverlapping(int[] nums, int target) {
        int numOfSubarrays = 0;
        int temp = 0;
        HashSet<int> visited = new HashSet<int> { 0 };
        foreach (int num in nums) {
            temp += num;
            int prev = temp - target;
            if (visited.Contains(prev)) {
                visited = new HashSet<int>();
                numOfSubarrays++;
            }
            visited.Add(temp);
        }
        return numOfSubarrays;
    }
}
