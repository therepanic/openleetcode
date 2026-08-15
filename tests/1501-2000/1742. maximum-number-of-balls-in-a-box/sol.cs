public class Solution {
    public int CountBalls(int lowLimit, int highLimit) {
        var boxCount = new Dictionary<int, int>();
        int maxBalls = 0;
        for (int num = lowLimit; num <= highLimit; num++) {
            int box = num.ToString().Sum(c => c - '0');
            boxCount[box] = boxCount.GetValueOrDefault(box) + 1;
            maxBalls = Math.Max(maxBalls, boxCount[box]);
        }
        return maxBalls;
    }
}
