class Solution {
public:
    string destCity(vector<vector<string>>& paths) {
        unordered_set<string> startCities;
        
        for (const auto& path : paths) {
            startCities.insert(path[0]);
        }
        
        for (const auto& path : paths) {
            if (startCities.find(path[1]) == startCities.end()) {
                return path[1];
            }
        }
        
        return "";
    }
};
