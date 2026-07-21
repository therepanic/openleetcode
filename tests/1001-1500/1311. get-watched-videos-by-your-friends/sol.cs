public class Solution {
    public IList<string> WatchedVideosByFriends(string[][] watchedVideos, int[][] friends, int id, int level) {
        int n = friends.Length;
        bool[] visited = new bool[n];
        Queue<(int, int)> q = new Queue<(int, int)>();
        q.Enqueue((id, 0));
        visited[id] = true;
        
        List<int> targetPeople = new List<int>();
        
        while (q.Count > 0) {
            var (person, dist) = q.Dequeue();
            
            if (dist == level) {
                targetPeople.Add(person);
                continue;
            }
            
            foreach (int f in friends[person]) {
                if (!visited[f]) {
                    visited[f] = true;
                    q.Enqueue((f, dist + 1));
                }
            }
        }
        
        Dictionary<string, int> freq = new Dictionary<string, int>();
        foreach (int p in targetPeople) {
            foreach (string vid in watchedVideos[p]) {
                if (freq.ContainsKey(vid)) {
                    freq[vid]++;
                } else {
                    freq[vid] = 1;
                }
            }
        }
        
        List<string> result = new List<string>(freq.Keys);
        result.Sort((a, b) => {
            int cmp = freq[a].CompareTo(freq[b]);
            if (cmp != 0) return cmp;
            return string.CompareOrdinal(a, b);
        });
        
        return result;
    }
}
