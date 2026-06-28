public class Solution {
    public IList<string> RemoveComments(string[] source) {
        bool inBlock = false;
        IList<string> ans = new List<string>();
        System.Text.StringBuilder newline = new System.Text.StringBuilder();
        foreach (string line in source) {
            int i = 0;
            if (!inBlock) {
                newline = new System.Text.StringBuilder();
            }
            while (i < line.Length) {
                if (i + 1 < line.Length && line[i] == '/' && line[i + 1] == '*' && !inBlock) {
                    inBlock = true;
                    i++;
                } else if (i + 1 < line.Length && line[i] == '*' && line[i + 1] == '/' && inBlock) {
                    inBlock = false;
                    i++;
                } else if (!inBlock && i + 1 < line.Length && line[i] == '/' && line[i + 1] == '/') {
                    break;
                } else if (!inBlock) {
                    newline.Append(line[i]);
                }
                i++;
            }
            if (newline.Length > 0 && !inBlock) {
                ans.Add(newline.ToString());
            }
        }
        return ans;
    }
}
