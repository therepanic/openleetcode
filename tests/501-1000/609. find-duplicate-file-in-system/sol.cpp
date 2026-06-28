class Solution {
public:
    vector<vector<string>> findDuplicate(vector<string>& paths) {
        unordered_map<string, vector<string>> map;
        for (const string& path : paths) {
            istringstream iss(path);
            string directory;
            iss >> directory;
            string file;
            while (iss >> file) {
                size_t parenIndex = file.find('(');
                string name = file.substr(0, parenIndex);
                string content = file.substr(parenIndex + 1, file.size() - parenIndex - 2);
                string fullPath = directory + "/" + name;
                map[content].push_back(fullPath);
            }
        }
        vector<vector<string>> result;
        for (auto& pair : map) {
            if (pair.second.size() > 1) {
                result.push_back(pair.second);
            }
        }
        return result;
    }
};
