public class Solution {
    public string DestCity(IList<IList<string>> paths) {
        HashSet<string> startCities = new HashSet<string>();
        
        foreach (var path in paths) {
            startCities.Add(path[0]);
        }
        
        foreach (var path in paths) {
            if (!startCities.Contains(path[1])) {
                return path[1];
            }
        }
        
        return "";
    }
}
