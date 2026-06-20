class Solution {
    public int findRadius(int[] houses, int[] heaters) {
        Arrays.sort(houses);
        Arrays.sort(heaters);
        int radius = 0;
        for (int house : houses) {
            int left = 0, right = heaters.length - 1;
            while (left < right) {
                int mid = (left + right) / 2;
                if (heaters[mid] < house) {
                    left = mid + 1;
                } else {
                    right = mid;
                }
            }
            int dist = Math.abs(heaters[left] - house);
            if (left > 0) {
                dist = Math.min(dist, Math.abs(heaters[left - 1] - house));
            }
            radius = Math.max(radius, dist);
        }
        return radius;
    }
}
