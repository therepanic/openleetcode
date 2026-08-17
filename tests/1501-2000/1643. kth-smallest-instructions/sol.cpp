class Solution {
public:
    string kthSmallestPath(vector<int>& destination, int k) {
        int rows = destination[0];
        int cols = destination[1];
        string path;
        long long k_local = k - 1;

        while (rows > 0 || cols > 0) {
            long long paths_with_h = 0;
            if (cols > 0) {
                paths_with_h = combination(rows + cols - 1, cols - 1);
            }

            if (k_local < paths_with_h) {
                path.push_back('H');
                cols--;
            } else {
                path.push_back('V');
                k_local -= paths_with_h;
                rows--;
            }
        }
        return path;
    }

private:
    long long combination(int n, int r) {
        if (r == 0 || r == n) return 1;
        r = min(r, n - r);
        long long result = 1;
        for (int i = 1; i <= r; ++i) {
            result = result * (n - r + i) / i;
        }
        return result;
    }
};
