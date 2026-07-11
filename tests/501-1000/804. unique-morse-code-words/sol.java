class Solution {
    public int uniqueMorseRepresentations(String[] words) {
        String[] storage = {
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
            "....", "..", ".---", "-.-", ".-..", "--", "-.",
            "---", ".--.", "--.-", ".-.", "...", "-", "..-",
            "...-", ".--", "-..-", "-.--", "--.."
        };

        Set<String> st = new HashSet<>();

        for (String word : words) {
            StringBuilder temp = new StringBuilder();
            for (char ch : word.toCharArray()) {
                temp.append(storage[ch - 'a']);
            }
            st.add(temp.toString());
        }

        return st.size();
    }
}
