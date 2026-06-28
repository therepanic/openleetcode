class Solution {
public:
    int findMinDifference(vector<string>& timePoints) {
        vector<int> times;
        for (const string& t : timePoints) {
            int h = stoi(t.substr(0, 2));
            int m = stoi(t.substr(3, 2));
            times.push_back(h * 60 + m);
        }
        sort(times.begin(), times.end());
        int minDiff = INT_MAX;
        for (int i = 1; i < times.size(); i++) {
            minDiff = min(minDiff, times[i] - times[i - 1]);
        }
        minDiff = min(minDiff, 1440 + times[0] - times[times.size() - 1]);
        return minDiff;
    }
};
