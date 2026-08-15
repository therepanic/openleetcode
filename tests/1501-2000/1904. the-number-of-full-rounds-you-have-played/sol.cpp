class Solution {
public:
    int numberOfRounds(string loginTime, string logoutTime) {
        auto toMinutes = [](const string& t) {
            int h = stoi(t.substr(0, 2));
            int m = stoi(t.substr(3, 2));
            return h * 60 + m;
        };

        int start = toMinutes(loginTime);
        int end = toMinutes(logoutTime);

        if (end < start) {
            end += 24 * 60;
        }

        int startRound = (start + 14) / 15;
        int endRound = end / 15;

        return max(0, endRound - startRound);
    }
};
