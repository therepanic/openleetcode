public class Solution {
    public string[] GetFolderNames(string[] names) {
        Dictionary<string, int> nameCount = new Dictionary<string, int>();
        string[] result = new string[names.Length];
        int idx = 0;

        foreach (string name in names) {
            if (!nameCount.ContainsKey(name)) {
                result[idx++] = name;
                nameCount[name] = 1;
            } else {
                int k = nameCount[name];
                while (nameCount.ContainsKey(name + "(" + k + ")")) {
                    k++;
                }
                string newName = name + "(" + k + ")";
                result[idx++] = newName;
                nameCount[name] = k + 1;
                nameCount[newName] = 1;
            }
        }

        return result;
    }
}
