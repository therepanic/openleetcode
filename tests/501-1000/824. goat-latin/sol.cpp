class Solution {
public:
    string toGoatLatin(string sentence) {
        unordered_set<char> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
        istringstream iss(sentence);
        string word, ans;
        int i = 0;
        while (iss >> word) {
            i++;
            string goat;
            if (vowels.count(word[0])) {
                goat = word + "ma";
            } else {
                goat = word.substr(1) + word[0] + "ma";
            }
            goat += string(i, 'a');
            if (!ans.empty()) ans += " ";
            ans += goat;
        }
        return ans;
    }
};
