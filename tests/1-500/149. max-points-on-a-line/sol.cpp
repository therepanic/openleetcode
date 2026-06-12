class Solution {
public:
    int maxPoints(vector<vector<int>>& points) {
        int n = points.size();
        if (n <= 2) return n;
        int best = 0;
        for (int i = 0; i < n; ++i) {
            unordered_map<string, int> count;
            int local = 0, duplicates = 1;
            for (int j = i + 1; j < n; ++j) {
                int dx = points[j][0] - points[i][0];
                int dy = points[j][1] - points[i][1];
                if (dx == 0 && dy == 0) {
                    ++duplicates;
                    continue;
                }
                int g = gcd(abs(dx), abs(dy));
                dx /= g;
                dy /= g;
                if (dx < 0) { dx = -dx; dy = -dy; }
                else if (dx == 0) dy = 1;
                else if (dy == 0) dx = 1;
                string key = to_string(dx) + "/" + to_string(dy);
                local = max(local, ++count[key]);
            }
            best = max(best, local + duplicates);
        }
        return best;
    }
};
