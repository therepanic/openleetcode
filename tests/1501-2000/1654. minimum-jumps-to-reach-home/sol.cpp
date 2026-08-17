class Solution {
public:
    int minimumJumps(vector<int>& forbidden, int a, int b, int x) {
        int idx = 1;
        int m = min(a, b);
        for (int i = 2; i <= m; i++) {
            if (a % i == 0 && b % i == 0) idx = i;
        }
        if (x % idx != 0) return -1;
        queue<array<int, 3>> q;
        q.push({0, 1, 0});
        unordered_set<int> visited;
        visited.insert(0);
        for (int f : forbidden) visited.insert(f);
        int top = *max_element(forbidden.begin(), forbidden.end());
        int limit = top + x + a + b;
        while (!q.empty()) {
            auto cur = q.front();
            q.pop();
            int curr = cur[0], prev = cur[1], step = cur[2];
            if (curr == x) return step;
            if (prev == 1) {
                int nb = curr - b;
                if (nb >= 0 && visited.find(nb) == visited.end()) {
                    visited.insert(nb);
                    q.push({nb, -1, step + 1});
                }
            }
            int na = curr + a;
            if (na <= limit && visited.find(na) == visited.end()) {
                visited.insert(na);
                q.push({na, 1, step + 1});
            }
        }
        return -1;
    }
};
