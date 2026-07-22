class Solution {
public:
    vector<string> watchedVideosByFriends(vector<vector<string>>& watchedVideos, vector<vector<int>>& friends, int id, int level) {
        int n = friends.size();
        vector<bool> visited(n, false);
        queue<pair<int, int>> q;
        q.push({id, 0});
        visited[id] = true;
        
        vector<int> targetPeople;
        
        while (!q.empty()) {
            auto [person, dist] = q.front();
            q.pop();
            
            if (dist == level) {
                targetPeople.push_back(person);
                continue;
            }
            
            for (int f : friends[person]) {
                if (!visited[f]) {
                    visited[f] = true;
                    q.push({f, dist + 1});
                }
            }
        }
        
        unordered_map<string, int> freq;
        for (int p : targetPeople) {
            for (const string& vid : watchedVideos[p]) {
                freq[vid]++;
            }
        }
        
        vector<string> result;
        for (const auto& [vid, _] : freq) {
            result.push_back(vid);
        }
        
        sort(result.begin(), result.end(), [&](const string& a, const string& b) {
            if (freq[a] != freq[b]) {
                return freq[a] < freq[b];
            }
            return a < b;
        });
        
        return result;
    }
};
