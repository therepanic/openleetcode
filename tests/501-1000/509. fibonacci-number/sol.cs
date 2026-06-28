public class Solution {
    public int Fib(int n) {
        double sqrt5 = Math.Sqrt(5);
        double fibN = Math.Pow((1 + sqrt5) / 2, n) - Math.Pow((1 - sqrt5) / 2, n);
        return (int)Math.Round(fibN / sqrt5);
    }
}
