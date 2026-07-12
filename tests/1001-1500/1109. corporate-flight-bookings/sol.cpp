class Solution {
public:
    vector<int> corpFlightBookings(vector<vector<int>>& bookings, int n) {
        vector<int> l(n + 1, 0);
        for (auto& i : bookings) {
            int x = i[0];
            int y = i[1];
            l[x - 1] += i[2];
            l[y] -= i[2];
        }
        
        vector<int> s;
        for (int i = 0; i < n; i++) {
            if (i == 0) {
                s.push_back(l[i]);
            } else {
                s.push_back(s[i - 1] + l[i]);
            }
        }
        return s;
    }
};
