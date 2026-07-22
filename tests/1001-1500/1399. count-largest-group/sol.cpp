class Solution {
public:
    int countLargestGroup(int n) {
        unordered_map<int, int> mpp;
        int maxi = 0, count = 0;

        for (int i = 1; i <= n; i++) {
            int x = digsum(i);
            mpp[x]++;
            maxi = max(maxi, mpp[x]);
        }

        for (auto& [k, v] : mpp) {
            if (v == maxi) {
                count++;
            }
        }
        return count;
    }

private:
    int digsum(int n) {
        int s = 0;
        while (n > 0) {
            s += n % 10;
            n /= 10;
        }
        return s;
    }
};
