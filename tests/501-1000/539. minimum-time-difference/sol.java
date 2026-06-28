class Solution {
    public int findMinDifference(List<String> timePoints) {
        int[] times = new int[timePoints.size()];
        for (int i = 0; i < timePoints.size(); i++) {
            String[] parts = timePoints.get(i).split(":");
            int h = Integer.parseInt(parts[0]);
            int m = Integer.parseInt(parts[1]);
            times[i] = h * 60 + m;
        }
        Arrays.sort(times);
        int minDiff = Integer.MAX_VALUE;
        for (int i = 1; i < times.length; i++) {
            minDiff = Math.min(minDiff, times[i] - times[i - 1]);
        }
        minDiff = Math.min(minDiff, 1440 + times[0] - times[times.length - 1]);
        return minDiff;
    }
}
