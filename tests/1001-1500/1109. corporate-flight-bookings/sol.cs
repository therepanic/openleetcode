public class Solution {
    public int[] CorpFlightBookings(int[][] bookings, int n) {
        int[] l = new int[n + 1];
        foreach (int[] i in bookings) {
            int x = i[0];
            int y = i[1];
            l[x - 1] += i[2];
            l[y] -= i[2];
        }
        
        int[] s = new int[n];
        for (int i = 0; i < n; i++) {
            if (i == 0) {
                s[i] = l[i];
            } else {
                s[i] = s[i - 1] + l[i];
            }
        }
        return s;
    }
}
