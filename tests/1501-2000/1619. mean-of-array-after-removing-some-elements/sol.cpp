class Solution {
public:
    double trimMean(vector<int>& arr) {
        int n = arr.size();
        int per5 = (int)(0.05 * n);
        sort(arr.begin(), arr.end());
        double sum = 0;
        for (int i = per5; i < n - per5; i++) {
            sum += arr[i];
        }
        return sum / (n - per5 - per5);
    }
};
