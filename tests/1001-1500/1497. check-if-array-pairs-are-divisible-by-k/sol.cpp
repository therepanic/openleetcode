class Solution {
public:
    bool canArrange(vector<int>& arr, int k) {
        vector<int> a(arr.size());
        for (int i = 0; i < arr.size(); i++) {
            a[i] = ((arr[i] % k) + k) % k;
        }
        sort(a.begin(), a.end());
        int j = 0;
        while (j < a.size() && a[j] == 0) j++;
        if (j % 2 != 0) return false;
        for (int l = j, r = a.size() - 1; l < r; l++, r--) {
            if ((a[l] + a[r]) % k != 0) return false;
        }
        return true;
    }
};
