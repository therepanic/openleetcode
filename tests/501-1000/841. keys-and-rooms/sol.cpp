class Solution {
public:
    bool canVisitAllRooms(vector<vector<int>>& rooms) {
        int n = rooms.size();
        vector<int> keys = {0};
        vector<bool> visited(n, false);
        visited[0] = true;
        int count = 1;
        while (!keys.empty()) {
            int room = keys.back();
            keys.pop_back();
            for (int i : rooms[room]) {
                if (!visited[i]) {
                    visited[i] = true;
                    keys.push_back(i);
                    count++;
                }
            }
        }
        return count == n;
    }
};
