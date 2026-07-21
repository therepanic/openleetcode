public class Solution {
    public int DaysBetweenDates(string date1, string date2) {
        var parts1 = date1.Split('-').Select(int.Parse).ToArray();
        var parts2 = date2.Split('-').Select(int.Parse).ToArray();
        int y1 = parts1[0], m1 = parts1[1], d1 = parts1[2];
        int y2 = parts2[0], m2 = parts2[1], d2 = parts2[2];
        return Math.Abs(DaysSince1970(y1, m1, d1) - DaysSince1970(y2, m2, d2));
    }

    private int DaysSince1970(int y, int m, int d) {
        if (m < 3) {
            y--;
            m += 12;
        }
        return 365 * y + y / 4 - y / 100 + y / 400 + (153 * m - 457) / 5 + d - 306 - 719468;
    }
}
