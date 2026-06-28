class Solution {
public:
    vector<vector<string>> accountsMerge(vector<vector<string>>& accounts) {
        int n = accounts.size();
        unordered_map<string, unordered_set<int>> location;
        vector<unordered_set<string>> content;
        
        for (int i = 0; i < n; i++) {
            string name = accounts[i][0];
            location[name].insert(i);
            unordered_set<string> emails(accounts[i].begin() + 1, accounts[i].end());
            content.push_back(emails);
        }
        
        for (auto& [name, indices] : location) {
            auto indicesCopy = indices;
            for (int i : indicesCopy) {
                if (indices.find(i) == indices.end()) continue;
                auto indicesCopy2 = indices;
                for (int j : indicesCopy2) {
                    if (i != j) {
                        bool disjoint = true;
                        for (const auto& email : content[i]) {
                            if (content[j].count(email)) {
                                disjoint = false;
                                break;
                            }
                        }
                        if (!disjoint) {
                            content[j].insert(content[i].begin(), content[i].end());
                            indices.erase(i);
                            break;
                        }
                    }
                }
            }
        }
        
        vector<vector<string>> result;
        for (auto& [name, indices] : location) {
            for (int idx : indices) {
                vector<string> merged = {name};
                vector<string> emails(content[idx].begin(), content[idx].end());
                sort(emails.begin(), emails.end());
                merged.insert(merged.end(), emails.begin(), emails.end());
                result.push_back(merged);
            }
        }
        return result;
    }
};
