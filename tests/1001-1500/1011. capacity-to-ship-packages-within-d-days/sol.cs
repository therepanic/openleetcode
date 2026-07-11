public class Solution {
    public int ShipWithinDays(int[] weights, int days) {
        int low = weights.Max();
        int high = weights.Sum();

        while (low <= high) {
            int mid = (low + high) / 2;

            int requiredDays = 1;
            int load = 0;

            foreach (int weight in weights) {
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
