class Solution {
    public int dayOfYear(String date) {
        int[] val = {0, 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
        int d = Integer.parseInt(date.substring(8));
        int m = Integer.parseInt(date.substring(5, 7));
        int y = Integer.parseInt(date.substring(0, 4));
        boolean isLeap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0);
        if (isLeap) {
            for (int i = 3; i <= 12; i++) {
                val[i] += 1;
            }
        }
        return d + val[m];
    }
}
