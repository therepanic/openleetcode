class Solution {
    public int numMatchingSubseq(String s, String[] words) {
        int n = s.length();
        java.util.Map<Character, java.util.ArrayList<Integer>> mp = new java.util.HashMap<>();
        for (int i = 0; i < n; i++) {
            char c = s.charAt(i);
            mp.computeIfAbsent(c, k -> new java.util.ArrayList<>()).add(i);
        }
        for (char c = 'a'; c <= 'z'; c++) {
            java.util.ArrayList<Integer> list = mp.getOrDefault(c, new java.util.ArrayList<>());
            list.add(n);
            java.util.Collections.sort(list);
            mp.put(c, list);
        }
        
        int cnt = 0;
        for (String word : words) {
            if (found(word, mp, n)) cnt++;
        }
        return cnt;
    }
    
    private boolean found(String word, java.util.Map<Character, java.util.ArrayList<Integer>> mp, int n) {
        int curr = -1;
        for (int i = 0; i < word.length(); i++) {
            char c = word.charAt(i);
            if (curr >= n) return false;
            java.util.ArrayList<Integer> arr = mp.get(c);
            int idx = java.util.Collections.binarySearch(arr, curr + 1);
            if (idx < 0) idx = -idx - 1;
            curr = arr.get(idx);
        }
        return curr < n;
    }
}
