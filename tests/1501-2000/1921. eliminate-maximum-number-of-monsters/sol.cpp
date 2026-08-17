class Solution {
public:
    int eliminateMaximum(vector<int>& dist, vector<int>& speed) {
        vector<int> arrival;
        for (int i = 0; i < dist.size(); i++) {
            arrival.push_back((dist[i] + speed[i] - 1) / speed[i]);
        }
        sort(arrival.begin(), arrival.end());
        for (int minute = 0; minute < arrival.size(); minute++) {
            if (arrival[minute] <= minute) {
                return minute;
            }
        }
        return arrival.size();
    }
};
