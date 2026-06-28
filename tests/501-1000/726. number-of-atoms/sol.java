class Solution {
    public String countOfAtoms(String formula) {
        java.util.Map<String, Integer> atomsFreq = new java.util.HashMap<>();
        int[] i = {0};
        atomsFreq = decodeAtomsHelper(i, formula);
        
        java.util.Map<String, Integer> sortedAtomFreq = new java.util.TreeMap<>(atomsFreq);
        
        StringBuilder decodedFormula = new StringBuilder();
        for (java.util.Map.Entry<String, Integer> entry : sortedAtomFreq.entrySet()) {
            decodedFormula.append(entry.getKey());
            if (entry.getValue() > 1) {
                decodedFormula.append(entry.getValue());
            }
        }
        
        return decodedFormula.toString();
    }
    
    private java.util.Map<String, Integer> decodeAtomsHelper(int[] i, String s) {
        int size = s.length();
        java.util.Map<String, Integer> decoded = new java.util.HashMap<>();
        
        while (i[0] < size) {
            StringBuilder atom = new StringBuilder();
            int power = 0;
            
            if (s.charAt(i[0]) >= 'A' && s.charAt(i[0]) <= 'Z') {
                atom.append(s.charAt(i[0]));
                i[0]++;
                
                while (i[0] < size && s.charAt(i[0]) >= 'a' && s.charAt(i[0]) <= 'z') {
                    atom.append(s.charAt(i[0]));
                    i[0]++;
                }
            }
            
            while (i[0] < size && s.charAt(i[0]) >= '0' && s.charAt(i[0]) <= '9') {
                power = power * 10 + (s.charAt(i[0]) - '0');
                i[0]++;
            }
            
            if (atom.length() != 0) {
                if (power == 0) {
                    decoded.put(atom.toString(), decoded.getOrDefault(atom.toString(), 0) + 1);
                } else {
                    decoded.put(atom.toString(), decoded.getOrDefault(atom.toString(), 0) + power);
                }
            }
            
            power = 0;
            atom = new StringBuilder();
            
            if (i[0] < size && s.charAt(i[0]) == '(') {
                i[0]++;
                java.util.Map<String, Integer> smallerDecoded = decodeAtomsHelper(i, s);
                
                power = 0;
                while (i[0] < size && s.charAt(i[0]) >= '0' && s.charAt(i[0]) <= '9') {
                    power = power * 10 + (s.charAt(i[0]) - '0');
                    i[0]++;
                }
                
                if (power == 0) {
                    power = 1;
                }
                
                for (java.util.Map.Entry<String, Integer> entry : smallerDecoded.entrySet()) {
                    decoded.put(entry.getKey(), decoded.getOrDefault(entry.getKey(), 0) + entry.getValue() * power);
                }
            }
            
            if (i[0] < size && s.charAt(i[0]) == ')') {
                i[0]++;
                return decoded;
            }
        }
        
        return decoded;
    }
}
