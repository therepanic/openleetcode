class Solution {
public:
    string findReplaceString(string s, vector<int>& indices, vector<string>& sources, vector<string>& targets) {
        unordered_map<int, pair<string, string>> patch;
        for (int k = 0; k < indices.size(); k++) {
            int i = indices[k];
            string src = sources[k];
            string tgt = targets[k];
            if (i + src.length() <= s.length() && s.substr(i, src.length()) == src) {
                patch[i] = {src, tgt};
            }
        }
        string res;
        int i = 0;
        int n = s.length();
        while (i < n) {
            if (patch.count(i)) {
                auto& [src, tgt] = patch[i];
                res += tgt;
                i += src.length();
            } else {
                res += s[i];
                i++;
            }
        }
        return res;
    }
};
