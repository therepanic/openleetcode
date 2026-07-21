class Solution {
public:
    int daysBetweenDates(string date1, string date2) {
        int y1, m1, d1, y2, m2, d2;
        sscanf(date1.c_str(), "%d-%d-%d", &y1, &m1, &d1);
        sscanf(date2.c_str(), "%d-%d-%d", &y2, &m2, &d2);
        return abs(daysSince1970(y1, m1, d1) - daysSince1970(y2, m2, d2));
    }

private:
    int daysSince1970(int y, int m, int d) {
        if (m < 3) {
            y--;
            m += 12;
        }
        return 365 * y + y / 4 - y / 100 + y / 400 + (153 * m - 457) / 5 + d - 306 - 719468;
    }
};
