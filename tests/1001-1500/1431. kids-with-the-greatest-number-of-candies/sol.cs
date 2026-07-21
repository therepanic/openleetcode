public class Solution {
    public IList<bool> KidsWithCandies(int[] candies, int extraCandies) {
        int currentMax = candies.Max();
        IList<bool> result = new List<bool>();
        foreach (int candyCount in candies) {
            if (candyCount + extraCandies >= currentMax) {
                result.Add(true);
            } else {
                result.Add(false);
            }
        }
        return result;
    }
}
