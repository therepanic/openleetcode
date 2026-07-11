class Solution {
public:
    int racecar(int target) {
        queue<tuple<int, int, int>> q;
        q.push({0, 1, 0});
        while (!q.empty()) {
            auto [cp, cs, nm] = q.front();
            q.pop();
            if (cp == target) return nm;
            q.push({cp + cs, cs * 2, nm + 1});
            if ((cp + cs > target && cs > 0) || (cp + cs < target && cs < 0)) {
                if (cs < 0) {
                    q.push({cp, 1, nm + 1});
                } else {
                    q.push({cp, -1, nm + 1});
                }
            }
        }
        return -1;
    }
};
