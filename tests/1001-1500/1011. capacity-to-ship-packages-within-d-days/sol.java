class Solution {
    public int shipWithinDays(int[] weights, int days) {
        int low = 0;
        int high = 0;
        for (int w : weights) {
            low = Math.max(low, w);
            high += w;
        }

        while (low <= high) {
            int mid = (low + high) / 2;

            int requiredDays = 1;
            int load = 0;

            for (int weight : weights) {
                if (load + weight > mid) {
                    requiredDays++;
                    load = weight;
                } else {
                    load += weight;
                }
            }

            if (requiredDays <= days) {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }

        return low;
    }
}
