using System.Collections.Generic;

public class Solution {
    public string SimplifyPath(string path) {
        var parts = new List<string>();
        foreach (string part in path.Split('/')) {
            if (part.Length == 0 || part == ".") {
                continue;
            }
            if (part == "..") {
                if (parts.Count > 0) {
                    parts.RemoveAt(parts.Count - 1);
                }
            } else {
                parts.Add(part);
            }
        }

        if (parts.Count == 0) {
            return "/";
        }
        return "/" + string.Join("/", parts);
    }
}
