class Solution {
public:
    vector<int> asteroidCollision(vector<int>& asteroids) {
        vector<int> res;
        for (int a : asteroids) {
            bool destroyed = false;
            while (!res.empty() && a < 0 && res.back() > 0) {
                if (-a > res.back()) {
                    res.pop_back();
                    continue;
                } else if (-a == res.back()) {
                    res.pop_back();
                }
                destroyed = true;
                break;
            }
            if (!destroyed) {
                res.push_back(a);
            }
        }
        return res;
    }
};
