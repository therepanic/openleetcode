class Solution {
    public int numDifferentIntegers(String word) {
        int i = 0, n = word.length();
        Set<String> st = new HashSet<>();
        while (i < n) {
            while (i < n && Character.isLetter(word.charAt(i))) {
                i++;
            }
            StringBuilder tempInt = new StringBuilder();
            while (i < n && Character.isDigit(word.charAt(i))) {
                tempInt.append(word.charAt(i));
                i++;
            }
            int j = 0;
            while (j + 1 < tempInt.length() && tempInt.charAt(j) == '0') {
                j++;
            }
            String k = tempInt.substring(j);
            if (!k.isEmpty()) {
                st.add(k);
            }
        }
        return st.size();
    }
}
