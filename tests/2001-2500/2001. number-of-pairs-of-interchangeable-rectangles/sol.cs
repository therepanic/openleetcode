public class Solution {
    public long InterchangeableRectangles(int[][] rectangles) {
        int Gcd(int a, int b) {
            while (b != 0) {
                int temp = a % b;
                a = b;
                b = temp;
            }
            return a;
        }
        
        var ratioCount = new Dictionary<(int, int), long>();
        long result = 0;
        
        foreach (var rect in rectangles) {
            int width = rect[0], height = rect[1];
            int g = Gcd(width, height);
            var reduced = (width / g, height / g);
            result += ratioCount.GetValueOrDefault(reduced);
            ratioCount[reduced] = ratioCount.GetValueOrDefault(reduced) + 1;
        }
        
        return result;
    }
}
