class Solution {
    public List<String> watchedVideosByFriends(String[][] watchedVideos, int[][] friends, int id, int level) {
        int n = friends.length;
        boolean[] visited = new boolean[n];
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{id, 0});
        visited[id] = true;
        
        List<Integer> targetPeople = new ArrayList<>();
        
        while (!q.isEmpty()) {
            int[] curr = q.poll();
            int person = curr[0];
            int dist = curr[1];
            
            if (dist == level) {
                targetPeople.add(person);
                continue;
            }
            
            for (int f : friends[person]) {
                if (!visited[f]) {
                    visited[f] = true;
                    q.offer(new int[]{f, dist + 1});
                }
            }
        }
        
        Map<String, Integer> freq = new HashMap<>();
        for (int p : targetPeople) {
            for (String vid : watchedVideos[p]) {
                freq.put(vid, freq.getOrDefault(vid, 0) + 1);
            }
        }
        
        List<String> result = new ArrayList<>(freq.keySet());
        result.sort((a, b) -> {
            int cmp = freq.get(a).compareTo(freq.get(b));
            if (cmp != 0) return cmp;
            return a.compareTo(b);
        });
        
        return result;
    }
}
