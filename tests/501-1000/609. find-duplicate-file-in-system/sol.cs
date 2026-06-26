public class Solution {
    public IList<IList<string>> FindDuplicate(string[] paths) {
        Dictionary<string, List<string>> map = new Dictionary<string, List<string>>();
        foreach (string path in paths) {
            string[] parts = path.Split(' ');
            string directory = parts[0];
            for (int i = 1; i < parts.Length; i++) {
                string file = parts[i];
                int parenIndex = file.IndexOf('(');
                string name = file.Substring(0, parenIndex);
                string content = file.Substring(parenIndex + 1, file.Length - parenIndex - 2);
                string fullPath = directory + "/" + name;
                if (!map.ContainsKey(content)) {
                    map[content] = new List<string>();
                }
                map[content].Add(fullPath);
            }
        }
        IList<IList<string>> result = new List<IList<string>>();
        foreach (var group in map.Values) {
            if (group.Count > 1) {
                result.Add(group);
            }
        }
        return result;
    }
}
