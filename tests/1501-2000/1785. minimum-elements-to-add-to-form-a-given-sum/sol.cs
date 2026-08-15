public class Solution {
    public int MinElements(int[] nums, int limit, int goal) {
        long currentSum = 0;
        foreach (int num in nums) {
            currentSum += num;
        }
        long diff = Math.Abs((long)goal - currentSum);
        return (int)((diff + limit - 1) / limit);
    }
}
