public class Solution {
    public int DayOfYear(string date) {
        var val = new Dictionary<int, int> {
            {1, 0}, {2, 31}, {3, 59}, {4, 90}, {5, 120}, {6, 151},
            {7, 181}, {8, 212}, {9, 243}, {10, 273}, {11, 304}, {12, 334}
        };
        int d = int.Parse(date.Substring(8));
        int m = int.Parse(date.Substring(5, 2));
        int y = int.Parse(date.Substring(0, 4));
        bool isLeap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0);
        if (isLeap) {
            for (int i = 3; i <= 12; i++) {
                val[i] += 1;
            }
        }
        return d + val[m];
    }
}
