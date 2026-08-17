public class Solution {
    public double AverageWaitingTime(int[][] customers) {
        long waiting = 0;
        int current = 0;
        foreach (var customer in customers) {
            int arrival = customer[0];
            int time = customer[1];
            if (current <= arrival) {
                current = arrival + time;
                waiting += time;
            } else {
                current += time;
                waiting += (current - arrival);
            }
        }
        return (double) waiting / customers.Length;
    }
}
