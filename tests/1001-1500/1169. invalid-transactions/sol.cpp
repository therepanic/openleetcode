class Solution {
public:
    vector<string> invalidTransactions(vector<string>& transactions) {
        unordered_map<string, vector<vector<string>>> userTxns;
        vector<string> invalids;

        for (string& txn : transactions) {
            stringstream ss(txn);
            string item;
            vector<string> vals;
            while (getline(ss, item, ',')) {
                vals.push_back(item);
            }
            userTxns[vals[0]].push_back(vals);
        }

        for (auto& [user, txns] : userTxns) {
            sort(txns.begin(), txns.end(), [](const vector<string>& a, const vector<string>& b) {
                return stoi(a[1]) < stoi(b[1]);
            });
            unordered_map<string, int> cities;
            int l = 0;
            unordered_set<int> invalidTxnWithinWindow;

            for (int r = 0; r < txns.size(); r++) {
                cities[txns[r][3]]++;
                while (l < r && stoi(txns[r][1]) - stoi(txns[l][1]) > 60) {
                    if (--cities[txns[l][3]] == 0) {
                        cities.erase(txns[l][3]);
                    }
                    invalidTxnWithinWindow.erase(l);
                    l++;
                }

                if (stoi(txns[r][2]) > 1000) {
                    string joined;
                    for (int j = 0; j < txns[r].size(); j++) {
                        if (j > 0) joined += ",";
                        joined += txns[r][j];
                    }
                    invalids.push_back(joined);
                }
                if (cities.size() > 1) {
                    for (int i = l; i <= r; i++) {
                        if (stoi(txns[i][2]) <= 1000 && invalidTxnWithinWindow.find(i) == invalidTxnWithinWindow.end()) {
                            string joined;
                            for (int j = 0; j < txns[i].size(); j++) {
                                if (j > 0) joined += ",";
                                joined += txns[i][j];
                            }
                            invalids.push_back(joined);
                            invalidTxnWithinWindow.insert(i);
                        }
                    }
                }
            }
        }

        return invalids;
    }
};
