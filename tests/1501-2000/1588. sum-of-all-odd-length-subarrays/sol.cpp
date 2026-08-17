class Solution {
public:
    int sumOddLengthSubarrays(vector<int>& arr) {
        int s = accumulate(arr.begin(), arr.end(), 0);
        int l = arr.size() - 1;
        int i = 2;
        while (l >= i) {
            int j = 0;
            int e = i;
            while (e <= l) {
                for (int k = j; k <= e; k++) {
                    s += arr[k];
                }
                j++;
                e++;
            }
            i += 2;
        }
        return s;
    }
};
