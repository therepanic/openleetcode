class Solution {
private:
    void addInTrie(map<string, void*>& trie, string word) {
        map<string, void*>* n = &trie;
        for (char letter : word) {
            string key(1, letter);
            if (n->find(key) == n->end()) {
                map<string, void*>* newNode = new map<string, void*>();
                (*newNode)["*"] = (void*)false;
                (*n)[key] = newNode;
            }
            n = (map<string, void*>*) (*n)[key];
        }
        (*n)["*"] = (void*)true;
    }
    
    string getReplacement(map<string, void*>& trie, string word) {
        map<string, void*>* n = &trie;
        for (int i = 0; i < word.length(); i++) {
            if ((bool)(*n)["*"]) {
                return word.substr(0, i);
            }
            string key(1, word[i]);
            if (n->find(key) == n->end()) {
                break;
            }
            n = (map<string, void*>*) (*n)[key];
        }
        return word;
    }
    
public:
    string replaceWords(vector<string>& dictionary, string sentence) {
        map<string, void*> trie;
        trie["*"] = (void*)false;
        
        stringstream ss(sentence);
        string word;
        vector<string> arr;
        while (ss >> word) {
            arr.push_back(word);
        }
        
        for (string& w : dictionary) {
            addInTrie(trie, w);
        }
        
        for (int i = 0; i < arr.size(); i++) {
            arr[i] = getReplacement(trie, arr[i]);
        }
        
        string result;
        for (int i = 0; i < arr.size(); i++) {
            if (i > 0) result += " ";
            result += arr[i];
        }
        return result;
    }
};
