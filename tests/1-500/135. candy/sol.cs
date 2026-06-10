public class Solution {
    public int Candy(int[] ratings) {
        int n = ratings.Length;
        var candies = Enumerable.Repeat(1, n).ToArray();
        for (int i = 1; i < n; i++) if (ratings[i] > ratings[i - 1]) candies[i] = candies[i - 1] + 1;
        for (int i = n - 2; i >= 0; i--) if (ratings[i] > ratings[i + 1]) candies[i] = System.Math.Max(candies[i], candies[i + 1] + 1);
        return candies.Sum();
    }
}
