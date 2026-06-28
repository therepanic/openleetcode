class Solution {
public:
    vector<int> findClosestElements(vector<int>& arr, int k, int x) {
        vector<int> sorted = arr;
        sort(sorted.begin(), sorted.end(), [x](int a, int b) {
            int da = abs(a - x);
            int db = abs(b - x);
            if (da != db) return da < db;
            return a < b;
        });
        vector<int> result(sorted.begin(), sorted.begin() + k);
        sort(result.begin(), result.end());
        return result;
    }
};
