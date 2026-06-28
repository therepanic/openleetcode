public class Solution {
    public int DeleteAndEarn(int[] nums) {
        var count = new Dictionary<int, int>();
        foreach (int num in nums) {
            if (count.ContainsKey(num)) {
                count[num]++;
            } else {
                count[num] = 1;
            }
        }
        var uniqueNums = new List<int>(count.Keys);
        uniqueNums.Sort();
        int? prev = null;
        int take = 0, skip = 0;

        foreach (int num in uniqueNums) {
            int maxPoints = Math.Max(skip, take);
            if (prev != null && prev == num - 1) {
                take = num * count[num] + skip;
                skip = maxPoints;
            } else {
                take = num * count[num] + maxPoints;
                skip = maxPoints;
            }
            prev = num;
        }

        return Math.Max(take, skip);
    }
}
