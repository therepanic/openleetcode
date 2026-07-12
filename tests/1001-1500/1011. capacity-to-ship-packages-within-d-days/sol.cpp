class Solution {
public:
    int shipWithinDays(vector<int>& weights, int days) {
        int low = *max_element(weights.begin(), weights.end());
        int high = accumulate(weights.begin(), weights.end(), 0);

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
};
