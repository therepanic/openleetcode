class Solution {
public:
    int findMaxValueOfEquation(vector<vector<int>>& points, int k) {
        deque<pair<int, int>> window;
        int answer = INT_MIN;
        for (auto& point : points) {
            int x = point[0];
            int y = point[1];
            while (!window.empty() && x - window.front().second > k) {
                window.pop_front();
            }
            if (!window.empty()) {
                answer = max(answer, x + y + window.front().first);
            }
            int value = y - x;
            while (!window.empty() && window.back().first <= value) {
                window.pop_back();
            }
            window.push_back({value, x});
        }
        return answer;
    }
};
