class Solution {
public:
    bool checkIfPangram(string sentence) {
        if (sentence.length() < 26) return false;
        
        for (int i = 0; i < 26; i++) {
            if (sentence.find((char)(97+i)) == string::npos) return false;
        }
        return true;
    }
};
