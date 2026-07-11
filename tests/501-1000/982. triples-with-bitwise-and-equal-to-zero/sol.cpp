class Solution {
public:
    int countTriplets(vector<int>& nums) {
        int most = 0;
        for (int num : nums) {
            if (num > most) most = num;
        }
        if (most == 0) return nums.size() * nums.size() * nums.size();

        int bits = 0;
        int tmp = most;
        while (tmp > 0) {
            bits++;
            tmp >>= 1;
        }
        int N = 1 << bits;

        vector<int> c(N, 0);
        for (int num : nums) {
            c[num]++;
        }

        for (int h = 1; h < N; h <<= 1) {
            for (int s = 0; s < N; s += h << 1) {
                for (int i = s; i < s + h; i++) {
                    c[i] += c[i + h];
                }
            }
        }

        for (int i = 0; i < N; i++) {
            c[i] = c[i] * c[i] * c[i];
        }

        for (int h = 1; h < N; h <<= 1) {
            for (int s = 0; s < N; s += h << 1) {
                for (int i = s; i < s + h; i++) {
                    c[i] -= c[i + h];
                }
            }
        }

        return c[0];
    }
};
