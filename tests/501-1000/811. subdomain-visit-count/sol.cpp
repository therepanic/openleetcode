class Solution {
public:
    vector<string> subdomainVisits(vector<string>& cpdomains) {
        unordered_map<string, int> freq;
        for (auto& entry : cpdomains) {
            istringstream iss(entry);
            int cnt;
            string dom;
            iss >> cnt >> dom;
            vector<string> parts;
            string part;
            istringstream domStream(dom);
            while (getline(domStream, part, '.')) {
                parts.push_back(part);
            }
            for (int i = 0; i < parts.size(); i++) {
                string sub;
                for (int j = i; j < parts.size(); j++) {
                    if (j > i) sub += ".";
                    sub += parts[j];
                }
                freq[sub] += cnt;
            }
        }
        vector<string> result;
        for (auto& [d, c] : freq) {
            result.push_back(to_string(c) + " " + d);
        }
        return result;
    }
};
