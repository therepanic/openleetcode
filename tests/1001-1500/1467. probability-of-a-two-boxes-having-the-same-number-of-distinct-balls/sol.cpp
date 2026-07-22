class Solution {
public:
    double getProbability(vector<int>& balls) {
        int sm = 0;
        for (int b : balls) sm += b;

        const int half = sm / 2;
        long long choose[49][49] = {};
        for (int n = 0; n <= 48; ++n) {
            choose[n][0] = choose[n][n] = 1;
            for (int k = 1; k < n; ++k) {
                choose[n][k] = choose[n - 1][k - 1] + choose[n - 1][k];
            }
        }

        const int k = static_cast<int>(balls.size());
        vector<long long> memo((k + 1) * (half + 1) * (k + 1) * (k + 1), -1);
        auto index = [=](int color, int used, int distinct0, int distinct1) {
            return (((color * (half + 1) + used) * (k + 1) + distinct0) * (k + 1) + distinct1);
        };
        function<long long(int, int, int, int)> dp = [&](int color, int used, int distinct0, int distinct1) -> long long {
            if (used > half) return 0;
            long long& cached = memo[index(color, used, distinct0, distinct1)];
            if (cached != -1) return cached;
            if (color == k) return cached = (used == half && distinct0 == distinct1);

            cached = 0;
            for (int first = 0; first <= balls[color]; ++first) {
                cached += choose[balls[color]][first] *
                          dp(color + 1, used + first,
                             distinct0 + (first > 0),
                             distinct1 + (first < balls[color]));
            }
            return cached;
        };

        long long favorable = dp(0, 0, 0, 0);
        long long total = choose[sm][half];
        return (double)favorable / total;
    }
};
