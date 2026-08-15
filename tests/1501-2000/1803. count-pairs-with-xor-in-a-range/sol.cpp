class Solution {
public:
    int countPairs(vector<int>& nums, int low, int high) {
        auto countLess = [&](int bound) -> long long {
            if (bound <= 0) return 0;
            vector<array<int, 2>> child(1, array<int, 2>{-1, -1});
            vector<int> counts(1, 0);
            long long total = 0;
            for (int value : nums) {
                int node = 0;
                for (int bit = 30; bit >= 0; --bit) {
                    int v = (value >> bit) & 1;
                    int b = (bound >> bit) & 1;
                    if (b) {
                        int same = child[node][v];
                        if (same != -1) total += counts[same];
                        node = child[node][1 - v];
                        if (node == -1) break;
                    } else {
                        node = child[node][v];
                        if (node == -1) break;
                    }
                }
                node = 0;
                for (int bit = 30; bit >= 0; --bit) {
                    int v = (value >> bit) & 1;
                    int nxt = child[node][v];
                    if (nxt == -1) {
                        nxt = static_cast<int>(child.size());
                        child[node][v] = nxt;
                        child.push_back(array<int, 2>{-1, -1});
                        counts.push_back(0);
                    }
                    node = child[node][v];
                    counts[node]++;
                }
            }
            return (int)total;
        };

        return static_cast<int>(countLess(high + 1) - countLess(low));
    }
};
