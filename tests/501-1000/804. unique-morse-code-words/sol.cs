public class Solution {
    public int UniqueMorseRepresentations(string[] words) {
        string[] storage = {
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
            "....", "..", ".---", "-.-", ".-..", "--", "-.",
            "---", ".--.", "--.-", ".-.", "...", "-", "..-",
            "...-", ".--", "-..-", "-.--", "--.."
        };

        HashSet<string> st = new HashSet<string>();

        foreach (string word in words) {
            string temp = "";
            foreach (char ch in word) {
                temp += storage[ch - 'a'];
            }
            st.Add(temp);
        }

        return st.Count;
    }
}
