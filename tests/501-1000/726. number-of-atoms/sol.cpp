class Solution {
public:
    string countOfAtoms(string formula) {
        int i = 0;
        unordered_map<string, int> atomsFreq = decodeAtomsHelper(i, formula);
        
        map<string, int> sortedAtomFreq(atomsFreq.begin(), atomsFreq.end());
        
        string decodedFormula = "";
        for (auto& entry : sortedAtomFreq) {
            decodedFormula += entry.first;
            if (entry.second > 1) {
                decodedFormula += to_string(entry.second);
            }
        }
        
        return decodedFormula;
    }
    
private:
    unordered_map<string, int> decodeAtomsHelper(int& i, string& s) {
        int size = s.length();
        unordered_map<string, int> decoded;
        
        while (i < size) {
            string atom = "";
            int power = 0;
            
            if (s[i] >= 'A' && s[i] <= 'Z') {
                atom += s[i];
                i++;
                
                while (i < size && s[i] >= 'a' && s[i] <= 'z') {
                    atom += s[i];
                    i++;
                }
            }
            
            while (i < size && s[i] >= '0' && s[i] <= '9') {
                power = power * 10 + (s[i] - '0');
                i++;
            }
            
            if (!atom.empty()) {
                if (power == 0) {
                    decoded[atom]++;
                } else {
                    decoded[atom] += power;
                }
            }
            
            power = 0;
            atom = "";
            
            if (i < size && s[i] == '(') {
                i++;
                unordered_map<string, int> smallerDecoded = decodeAtomsHelper(i, s);
                
                power = 0;
                while (i < size && s[i] >= '0' && s[i] <= '9') {
                    power = power * 10 + (s[i] - '0');
                    i++;
                }
                
                if (power == 0) {
                    power = 1;
                }
                
                for (auto& entry : smallerDecoded) {
                    decoded[entry.first] += entry.second * power;
                }
            }
            
            if (i < size && s[i] == ')') {
                i++;
                return decoded;
            }
        }
        
        return decoded;
    }
};
