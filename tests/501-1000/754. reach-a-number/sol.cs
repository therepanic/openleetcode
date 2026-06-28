public class Solution {
    public int ReachNumber(int target) {
        target = Math.Abs(target);
        int n = (int)((-1 + Math.Sqrt(1.0 + 8.0 * target)) / 2);
        int a = n * (n + 1) / 2;
        int b = a + n + 1;
        
        if (a == target)
            return n;
        if ((b - target) % 2 == 0)
            return n + 1;
        return (n + 2) % 2 == 1 ? n + 2 : n + 3;
    }
}
