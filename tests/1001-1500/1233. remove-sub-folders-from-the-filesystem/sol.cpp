class Solution {
public:
    vector<string> removeSubfolders(vector<string>& folder) {
        sort(folder.begin(), folder.end());
        vector<string> res;
        for (const string& f : folder) {
            if (res.empty()) {
                res.push_back(f);
            } else {
                string prev = res.back();
                if (f.find(prev) == 0 && f.size() > prev.size() && f[prev.size()] == '/') {
                    continue;
                } else {
                    res.push_back(f);
                }
            }
        }
        return res;
    }
};
