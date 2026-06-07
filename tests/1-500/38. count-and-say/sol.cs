public class Solution {
    public string CountAndSay(int n) {
        string current = "1";
        for (int step = 1; step < n; step++) {
            var next = new System.Text.StringBuilder();
            for (int i = 0; i < current.Length;) {
                int j = i;
                while (j < current.Length && current[j] == current[i]) j++;
                next.Append(j - i).Append(current[i]);
                i = j;
            }
            current = next.ToString();
        }
        return current;
    }
}
