public class Solution {
    public int SingleNumber(int[] nums) {
        long totalSum = 0;
        var seen = new HashSet<int>();
        foreach (int num in nums) {
            totalSum += num;
            seen.Add(num);
        }
        long uniqueSum = 0;
        foreach (int num in seen) {
            uniqueSum += num;
        }
        long numerator = 3 * uniqueSum - totalSum;
        return (int)(numerator >> 1);
    }
}
