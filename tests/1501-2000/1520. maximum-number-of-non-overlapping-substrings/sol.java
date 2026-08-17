class Solution {
    public List<String> maxNumOfSubstrings(String s) {
        int n = s.length();
        Map<Character, Integer> counts = new HashMap<>();
        for (char c : s.toCharArray()) {
            counts.put(c, counts.getOrDefault(c, 0) + 1);
        }
        Map<Character, Integer> first = new HashMap<>();
        Map<Character, Integer> last = new HashMap<>();
        for (char c : counts.keySet()) {
            first.put(c, s.indexOf(c));
            last.put(c, s.lastIndexOf(c));
        }
        
        List<String> res = new ArrayList<>();
        Deque<int[]> queue = new ArrayDeque<>();
        
        for (char c : counts.keySet()) {
            queue.addFirst(new int[]{first.get(c), last.get(c), counts.get(c)});
            int left = Integer.MAX_VALUE;
            int right = Integer.MIN_VALUE;
            int total = 0;
            
            for (int[] arr : queue) {
                total += arr[2];
                left = Math.min(left, arr[0]);
                right = Math.max(right, arr[1]);
                if (total == right - left + 1) {
                    break;
                }
            }
            
            if (total == right - left + 1) {
                res.add(s.substring(left, right + 1));
                queue.clear();
            }
        }
        
        return res;
    }
}
