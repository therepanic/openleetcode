class Solution {
public:
    int numDifferentIntegers(string word) {
        int i = 0, n = word.length();
        unordered_set<string> st;
        while (i < n) {
            while (i < n && isalpha(word[i])) {
                i++;
            }
            string tempInt;
            while (i < n && isdigit(word[i])) {
                tempInt += word[i];
                i++;
            }
            int j = 0;
            while (j + 1 < tempInt.length() && tempInt[j] == '0') {
                j++;
            }
            string k = tempInt.substr(j);
            if (!k.empty()) {
                st.insert(k);
            }
        }
        return st.size();
    }
};
