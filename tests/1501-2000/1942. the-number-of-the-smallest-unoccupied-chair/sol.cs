public class Solution {
    public int SmallestChair(int[][] times, int targetFriend) {
        int[] target_time = times[targetFriend];
        Array.Sort(times, (a, b) => a[0].CompareTo(b[0]));

        int n = times.Length;
        int[] chair_time = new int[n];

        foreach (int[] time in times) {
            for (int i = 0; i < n; i++) {
                if (chair_time[i] <= time[0]) {
                    chair_time[i] = time[1];
                    if (time[0] == target_time[0] && time[1] == target_time[1]) {
                        return i;
                    }
                    break;
                }
            }
        }

        return 0;
    }
}
