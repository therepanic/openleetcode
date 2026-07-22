class Solution {
public:
    vector<int> peopleIndexes(vector<vector<string>>& favoriteCompanies) {
        vector<unordered_set<string>> sets;
        for (const auto& companies : favoriteCompanies) {
            sets.push_back(unordered_set<string>(companies.begin(), companies.end()));
        }
        
        vector<int> result;
        int n = sets.size();
        
        for (int i = 0; i < n; i++) {
            bool isSubset = false;
            for (int j = 0; j < n; j++) {
                if (i != j) {
                    bool allFound = true;
                    for (const auto& company : sets[i]) {
                        if (sets[j].find(company) == sets[j].end()) {
                            allFound = false;
                            break;
                        }
                    }
                    if (allFound) {
                        isSubset = true;
                        break;
                    }
                }
            }
            if (!isSubset) {
                result.push_back(i);
            }
        }
        
        return result;
    }
};
