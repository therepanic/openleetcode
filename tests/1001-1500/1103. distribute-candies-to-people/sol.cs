public class Solution {
    public int[] DistributeCandies(int candies, int num_people) {
        int[] res = new int[num_people];
        int give = 1;
        int i = 0;

        while (candies > 0) {
            res[i % num_people] += Math.Min(give, candies);
            candies -= give;
            give++;
            i++;
        }

        return res;
    }
}
