class Solution {
public:
    double average(vector<int>& salary) {
        int max_val = *max_element(salary.begin(), salary.end());
        int min_val = *min_element(salary.begin(), salary.end());
        double total = 0.0;
        int count = 0;
        for (int s : salary) {
            if (s != max_val && s != min_val) {
                total += s;
                count++;
            }
        }
        return total / count;
    }
};
