class Solution {
public:
    bool detectCapitalUse(string word) {
        string upper = word, lower = word, title = word;
        for (char& c : upper) c = toupper(c);
        for (char& c : lower) c = tolower(c);
        if (!title.empty()) {
            title[0] = toupper(title[0]);
            for (size_t i = 1; i < title.size(); i++) title[i] = tolower(title[i]);
        }
        return word == upper || word == lower || word == title;
    }
};
