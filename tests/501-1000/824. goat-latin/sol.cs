public class Solution {
    public string ToGoatLatin(string sentence) {
        var vowels = new HashSet<char> { 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' };
        var words = sentence.Split(' ');
        var ans = new List<string>();
        for (int i = 0; i < words.Length; i++) {
            string word = words[i];
            string goat;
            if (vowels.Contains(word[0])) {
                goat = word + "ma";
            } else {
                goat = word.Substring(1) + word[0] + "ma";
            }
            goat += new string('a', i + 1);
            ans.Add(goat);
        }
        return string.Join(" ", ans);
    }
}
