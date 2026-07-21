class Solution {
public:
    vector<string> getFolderNames(vector<string>& names) {
        unordered_map<string, int> nameCount;
        vector<string> result;

        for (const string& name : names) {
            if (nameCount.find(name) == nameCount.end()) {
                result.push_back(name);
                nameCount[name] = 1;
            } else {
                int k = nameCount[name];
                while (nameCount.find(name + "(" + to_string(k) + ")") != nameCount.end()) {
                    k++;
                }
                string newName = name + "(" + to_string(k) + ")";
                result.push_back(newName);
                nameCount[name] = k + 1;
                nameCount[newName] = 1;
            }
        }

        return result;
    }
};
