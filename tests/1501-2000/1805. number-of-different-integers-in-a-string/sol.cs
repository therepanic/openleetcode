public class Solution {
    public int NumDifferentIntegers(string word) {
        int i = 0, n = word.Length;
        var st = new HashSet<string>();
        while (i < n) {
            while (i < n && char.IsLetter(word[i])) {
                i++;
            }
            var tempInt = new System.Text.StringBuilder();
            while (i < n && char.IsDigit(word[i])) {
                tempInt.Append(word[i]);
                i++;
            }
            int j = 0;
            while (j + 1 < tempInt.Length && tempInt[j] == '0') {
                j++;
            }
            string k = tempInt.ToString().Substring(j);
            if (!string.IsNullOrEmpty(k)) {
                st.Add(k);
            }
        }
        return st.Count;
    }
}
