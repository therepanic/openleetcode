public class Solution {
    public string LongestDiverseString(int a, int b, int c) {
        int[] counts = { a, b, c };
        char[] letters = { 'a', 'b', 'c' };
        var result = new System.Text.StringBuilder();
        while (true) {
            int choice = -1;
            for (int i = 0; i < 3; i++) {
                if (counts[i] == 0) continue;
                if (result.Length >= 2 && result[result.Length - 1] == letters[i] && result[result.Length - 2] == letters[i]) continue;
                if (choice == -1 || counts[i] > counts[choice]) choice = i;
            }
            if (choice == -1) break;
            result.Append(letters[choice]);
            counts[choice]--;
        }
        return result.ToString();
    }
}
