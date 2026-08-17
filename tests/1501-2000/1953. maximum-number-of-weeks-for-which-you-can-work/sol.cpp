class Solution {
public:
    long long numberOfWeeks(vector<int>& milestones) {
        long long total = 0;
        long long max_val = 0;
        for (int m : milestones) {
            total += m;
            if (m > max_val) max_val = m;
        }
        if (max_val <= total - max_val) {
            return total;
        } else {
            return 2 * (total - max_val) + 1;
        }
    }
};
