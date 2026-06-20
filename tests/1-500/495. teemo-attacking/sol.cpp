class Solution {
public:
    int findPoisonedDuration(vector<int>& timeSeries, int duration) {
        int totalSecs = 0;
        int prev = -1;
        bool hasPrev = false;

        for (int t : timeSeries) {
            totalSecs += duration;

            if (hasPrev && prev + duration > t) {
                totalSecs -= (prev + duration - t);
            }

            prev = t;
            hasPrev = true;
        }

        return totalSecs;
    }
};
