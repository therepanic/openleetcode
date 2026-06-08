class Solution {
public:
    string simplifyPath(string path) {
        vector<string> parts;
        string cur;

        for (int i = 0; i <= static_cast<int>(path.size()); ++i) {
            if (i == static_cast<int>(path.size()) || path[i] == '/') {
                if (cur == "..") {
                    if (!parts.empty()) {
                        parts.pop_back();
                    }
                } else if (!cur.empty() && cur != ".") {
                    parts.push_back(cur);
                }
                cur.clear();
            } else {
                cur.push_back(path[i]);
            }
        }

        if (parts.empty()) {
            return "/";
        }

        string res;
        for (const string& part : parts) {
            res += "/" + part;
        }
        return res;
    }
};
