class Solution {
public:
    double averageWaitingTime(vector<vector<int>>& customers) {
        long long waiting = 0;
        int current = 0;
        for (auto& customer : customers) {
            int arrival = customer[0];
            int time = customer[1];
            if (current <= arrival) {
                current = arrival + time;
                waiting += time;
            } else {
                current += time;
                waiting += (current - arrival);
            }
        }
        return (double) waiting / customers.size();
    }
};
