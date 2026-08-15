public class Solution {
    public IList<string> AlertNames(string[] keyName, string[] keyTime) {
        var map = new Dictionary<string, List<int>>();
        
        for (int i = 0; i < keyName.Length; i++) {
            var parts = keyTime[i].Split(':');
            int minutes = int.Parse(parts[0]) * 60 + int.Parse(parts[1]);
            if (!map.ContainsKey(keyName[i])) {
                map[keyName[i]] = new List<int>();
            }
            map[keyName[i]].Add(minutes);
        }
        
        var result = new List<string>();
        
        foreach (var kvp in map) {
            var times = kvp.Value;
            times.Sort();
            for (int i = 0; i < times.Count - 2; i++) {
                if (times[i+2] - times[i] <= 60) {
                    result.Add(kvp.Key);
                    break;
                }
            }
        }
        
        result.Sort();
        return result;
    }
}
