class Solution {
public:
    vector<int> closestRoom(vector<vector<int>>& rooms, vector<vector<int>>& queries) {
        sort(rooms.begin(), rooms.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] > b[1];
        });

        vector<int> idx(queries.size());
        iota(idx.begin(), idx.end(), 0);
        sort(idx.begin(), idx.end(), [&](int a, int b) {
            return queries[a][1] > queries[b][1];
        });

        set<int> active;
        vector<int> result(queries.size(), -1);
        int roomPtr = 0;

        for (int qi : idx) {
            int preferred = queries[qi][0];
            int minimum = queries[qi][1];

            while (roomPtr < rooms.size() && rooms[roomPtr][1] >= minimum) {
                active.insert(rooms[roomPtr][0]);
                roomPtr++;
            }

            vector<int> candidates;
            auto it = active.lower_bound(preferred);
            if (it != active.end()) candidates.push_back(*it);
            if (it != active.begin()) {
                --it;
                candidates.push_back(*it);
            }

            if (!candidates.empty()) {
                int best = candidates[0];
                for (int i = 1; i < candidates.size(); i++) {
                    int id = candidates[i];
                    if (abs(id - preferred) < abs(best - preferred) ||
                        (abs(id - preferred) == abs(best - preferred) && id < best)) {
                        best = id;
                    }
                }
                result[qi] = best;
            }
        }
        return result;
    }
};
