class Solution {
public:
    vector<string> removeComments(vector<string>& source) {
        bool inBlock = false;
        vector<string> ans;
        string newline;
        for (const string& line : source) {
            int i = 0;
            if (!inBlock) {
                newline = "";
            }
            while (i < line.size()) {
                if (i + 1 < line.size() && line[i] == '/' && line[i + 1] == '*' && !inBlock) {
                    inBlock = true;
                    i++;
                } else if (i + 1 < line.size() && line[i] == '*' && line[i + 1] == '/' && inBlock) {
                    inBlock = false;
                    i++;
                } else if (!inBlock && i + 1 < line.size() && line[i] == '/' && line[i + 1] == '/') {
                    break;
                } else if (!inBlock) {
                    newline += line[i];
                }
                i++;
            }
            if (!newline.empty() && !inBlock) {
                ans.push_back(newline);
            }
        }
        return ans;
    }
};
