class Solution {
    public String maximumBinaryString(String binary) {
        int n = binary.length();
        int z = 0;
        for (char c : binary.toCharArray()) {
            if (c == '0') z++;
        }
        
        if (z < 2) return binary;
        
        int firstZero = binary.indexOf('0');
        int p = firstZero + z - 1;
        
        return "1".repeat(p) + "0" + "1".repeat(n - p - 1);
    }
}
