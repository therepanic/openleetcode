class Solution {
  List<String> watchedVideosByFriends(List<List<String>> watchedVideos, List<List<int>> friends, int id, int level) {
    int n = friends.length;
    List<bool> visited = List.filled(n, false);
    Queue<List<int>> q = Queue();
    q.add([id, 0]);
    visited[id] = true;
    
    List<int> targetPeople = [];
    
    while (q.isNotEmpty) {
      List<int> curr = q.removeFirst();
      int person = curr[0];
      int dist = curr[1];
      
      if (dist == level) {
        targetPeople.add(person);
        continue;
      }
      
      for (int f in friends[person]) {
        if (!visited[f]) {
          visited[f] = true;
          q.add([f, dist + 1]);
        }
      }
    }
    
    Map<String, int> freq = {};
    for (int p in targetPeople) {
      for (String vid in watchedVideos[p]) {
        freq[vid] = (freq[vid] ?? 0) + 1;
      }
    }
    
    List<String> result = freq.keys.toList();
    result.sort((a, b) {
      int cmp = freq[a]!.compareTo(freq[b]!);
      if (cmp != 0) return cmp;
      return a.compareTo(b);
    });
    
    return result;
  }
}
