class Solution {
public:
    vector<string> alertNames(vector<string>& keyName, vector<string>& keyTime) {
        unordered_map<string, vector<int>> mp;
        
        for (int i = 0; i < keyName.size(); i++) {
            int h = stoi(keyTime[i].substr(0, 2));
            int m = stoi(keyTime[i].substr(3));
            int minutes = h * 60 + m;
            mp[keyName[i]].push_back(minutes);
        }
        
        vector<string> result;
        
        for (auto& [name, times] : mp) {
            sort(times.begin(), times.end());
            for (int i = 0; i + 2 < times.size(); i++) {
                if (times[i+2] - times[i] <= 60) {
                    result.push_back(name);
                    break;
                }
            }
        }
        
        sort(result.begin(), result.end());
        return result;
    }
};
