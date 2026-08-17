class Solution {
public:
    int reinitializePermutation(int n) {
        vector<int> original(n);
        for (int i = 0; i < n; i++) original[i] = i;
        vector<int> permut = original;
        vector<int> arr(n);
        int count = 0;
        while (true) {
            for (int i = 0; i < n; i++) {
                if (i % 2 == 0) {
                    arr[i] = permut[i / 2];
                } else {
                    arr[i] = permut[n / 2 + (i - 1) / 2];
                }
            }
            permut = arr;
            count++;
            if (permut == original) break;
        }
        return count;
    }
};
