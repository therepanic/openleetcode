class Solution {
    public int daysBetweenDates(String date1, String date2) {
        String[] parts1 = date1.split("-");
        String[] parts2 = date2.split("-");
        int y1 = Integer.parseInt(parts1[0]);
        int m1 = Integer.parseInt(parts1[1]);
        int d1 = Integer.parseInt(parts1[2]);
        int y2 = Integer.parseInt(parts2[0]);
        int m2 = Integer.parseInt(parts2[1]);
        int d2 = Integer.parseInt(parts2[2]);
        return Math.abs(daysSince1970(y1, m1, d1) - daysSince1970(y2, m2, d2));
    }

    private int daysSince1970(int y, int m, int d) {
        if (m < 3) {
            y--;
            m += 12;
        }
        return 365 * y + y / 4 - y / 100 + y / 400 + (153 * m - 457) / 5 + d - 306 - 719468;
    }
}
