class Solution {
public:
    vector<double> sampleStats(vector<int>& count) {
        auto kth = [&](int k) -> int {
            int acc = 0;
            for (int v = 0; v < count.size(); v++) {
                acc += count[v];
                if (acc >= k) {
                    return v;
                }
            }
            return 0;
        };

        int tot = 0;
        long long cnt = 0;
        int mini = -1;
        int maxi = 0;
        int mode = 0;
        int modeCnt = 0;

        for (int v = 0; v < count.size(); v++) {
            int c = count[v];
            if (c > 0) {
                if (mini == -1) {
                    mini = v;
                }
                maxi = v;
                tot += c;
                cnt += (long long)v * c;
                if (c > modeCnt) {
                    modeCnt = c;
                    mode = v;
                }
            }
        }

        double m;
        if (tot % 2 == 1) {
            m = kth(tot / 2 + 1);
        } else {
            m = (kth(tot / 2) + kth(tot / 2 + 1)) / 2.0;
        }

        return {(double)mini, (double)maxi, (double)cnt / tot, m, (double)mode};
    }
};
