public class Solution {
    public int DistributeCandies(int[] candyType) {
        int n = candyType.Length;
        int k = n / 2;
        var set = new HashSet<int>(candyType);
        return Math.Min(k, set.Count);
    }
}
