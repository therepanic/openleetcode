public class Solution {
    public string CountOfAtoms(string formula) {
        int i = 0;
        Dictionary<string, int> atomsFreq = DecodeAtomsHelper(ref i, formula);
        
        var sortedKeys = atomsFreq.Keys.OrderBy(k => k);
        System.Text.StringBuilder decodedFormula = new System.Text.StringBuilder();
        
        foreach (string key in sortedKeys) {
            decodedFormula.Append(key);
            if (atomsFreq[key] > 1) {
                decodedFormula.Append(atomsFreq[key]);
            }
        }
        
        return decodedFormula.ToString();
    }
    
    private Dictionary<string, int> DecodeAtomsHelper(ref int i, string s) {
        int size = s.Length;
        Dictionary<string, int> decoded = new Dictionary<string, int>();
        
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
            
            if (!string.IsNullOrEmpty(atom)) {
                if (power == 0) {
                    if (!decoded.ContainsKey(atom)) decoded[atom] = 0;
                    decoded[atom]++;
                } else {
                    if (!decoded.ContainsKey(atom)) decoded[atom] = 0;
                    decoded[atom] += power;
                }
            }
            
            power = 0;
            atom = "";
            
            if (i < size && s[i] == '(') {
                i++;
                Dictionary<string, int> smallerDecoded = DecodeAtomsHelper(ref i, s);
                
                power = 0;
                while (i < size && s[i] >= '0' && s[i] <= '9') {
                    power = power * 10 + (s[i] - '0');
                    i++;
                }
                
                if (power == 0) {
                    power = 1;
                }
                
                foreach (var entry in smallerDecoded) {
                    if (!decoded.ContainsKey(entry.Key)) decoded[entry.Key] = 0;
                    decoded[entry.Key] += entry.Value * power;
                }
            }
            
            if (i < size && s[i] == ')') {
                i++;
                return decoded;
            }
        }
        
        return decoded;
    }
}
