class Solution {
    public int smallestChair(int[][] times, int targetFriend) {
        int[] target_time = times[targetFriend];
        Arrays.sort(times, (a, b) -> Integer.compare(a[0], b[0]));

        int n = times.length;
        int[] chair_time = new int[n];

        for (int[] time : times) {
            for (int i = 0; i < n; i++) {
                if (chair_time[i] <= time[0]) {
                    chair_time[i] = time[1];
                    if (Arrays.equals(time, target_time)) {
                        return i;
                    }
                    break;
                }
            }
        }

        return 0;
    }
}
