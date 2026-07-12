class Solution {
public:
    int maxSatisfied(vector<int>& customers, vector<int>& grumpy, int minutes) {
        int n = customers.size();
        int total_satisfied = 0;
        int current_window_gain = 0;
        
        for (int i = 0; i < n; ++i) {
            if (!grumpy[i]) {
                total_satisfied += customers[i];
            } else if (i < minutes) {
                current_window_gain += customers[i];
            }
        }
        
        int max_window_gain = current_window_gain;
        
        for (int i = minutes; i < n; ++i) {
            if (grumpy[i]) {
                current_window_gain += customers[i];
            }
            if (grumpy[i - minutes]) {
                current_window_gain -= customers[i - minutes];
            }
            if (current_window_gain > max_window_gain) {
                max_window_gain = current_window_gain;
            }
        }
        
        return total_satisfied + max_window_gain;
    }
};
