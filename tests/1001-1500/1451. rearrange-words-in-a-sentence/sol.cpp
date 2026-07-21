class Solution {
public:
    string arrangeWords(string text) {
        vector<string> s;
        istringstream iss(text);
        string word;
        while (iss >> word) {
            s.push_back(word);
        }
        stable_sort(s.begin(), s.end(), [](const string& a, const string& b) {
            return a.length() < b.length();
        });
        for (auto& w : s) {
            transform(w.begin(), w.end(), w.begin(), ::tolower);
        }
        if (!s.empty()) {
            s[0][0] = toupper(s[0][0]);
        }
        ostringstream oss;
        for (size_t i = 0; i < s.size(); ++i) {
            if (i > 0) oss << " ";
            oss << s[i];
        }
        return oss.str();
    }
};
