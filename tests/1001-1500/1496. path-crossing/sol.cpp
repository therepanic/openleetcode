class Solution {
public:
    bool isPathCrossing(string path) {
        set<pair<int, int>> s;
        int x = 0, y = 0;
        s.insert({0, 0});
        for (char c : path) {
            if (c == 'N') y++;
            else if (c == 'S') y--;
            else if (c == 'E') x++;
            else if (c == 'W') x--;
            if (s.count({x, y})) return true;
            s.insert({x, y});
        }
        return false;
    }
};
