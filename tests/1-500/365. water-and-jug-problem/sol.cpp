#include <stack>
#include <unordered_set>
#include <utility>
using namespace std;

class Solution {
public:
    bool canMeasureWater(int x, int y, int target) {
        if (target > x + y) {
            return false;
        }
        stack<pair<int, int>> stk;
        unordered_set<string> visited;
        stk.push({0, 0});
        while (!stk.empty()) {
            auto [a, b] = stk.top();
            stk.pop();
            if (a + b == target) {
                return true;
            }
            string key = to_string(a) + "," + to_string(b);
            if (visited.count(key)) {
                continue;
            }
            visited.insert(key);
            stk.push({x, b});
            stk.push({a, y});
            stk.push({0, b});
            stk.push({a, 0});
            int w = min(a, y - b);
            stk.push({a - w, b + w});
            w = min(b, x - a);
            stk.push({a + w, b - w});
        }
        return false;
    }
};
