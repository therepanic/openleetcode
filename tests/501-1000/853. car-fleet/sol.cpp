class Solution {
public:
    int carFleet(int target, vector<int>& position, vector<int>& speed) {
        vector<pair<int, int>> cars;
        for (int i = 0; i < position.size(); i++) {
            cars.push_back({position[i], speed[i]});
        }
        sort(cars.begin(), cars.end(), [](auto& a, auto& b) {
            return a.first > b.first;
        });
        vector<double> stack;
        for (auto& [p, s] : cars) {
            double t = (double)(target - p) / s;
            if (stack.empty() || t > stack.back()) {
                stack.push_back(t);
            }
        }
        return stack.size();
    }
};
