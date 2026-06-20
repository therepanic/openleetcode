public class Solution {
    public int ArrangeCoins(int n) {
        return (int)((Math.Sqrt(8.0 * n + 1) - 1) / 2);
    }
}
