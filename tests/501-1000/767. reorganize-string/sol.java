class Solution {
    public String reorganizeString(String s) {
        int[] count = new int[26];
        for (char c : s.toCharArray()) {
            count[c - 'a']++;
        }
        
        PriorityQueue<int[]> maxHeap = new PriorityQueue<>((a, b) -> b[0] - a[0]);
        for (int i = 0; i < 26; i++) {
            if (count[i] > 0) {
                maxHeap.offer(new int[]{count[i], i + 'a'});
            }
        }
        
        StringBuilder res = new StringBuilder();
        int prevFreq = 0;
        char prevChar = ' ';
        
        while (!maxHeap.isEmpty()) {
            int[] curr = maxHeap.poll();
            int freq = curr[0];
            char c = (char) curr[1];
            
            res.append(c);
            
            if (prevFreq > 0) {
                maxHeap.offer(new int[]{prevFreq, prevChar});
            }
            
            freq--;
            prevFreq = freq;
            prevChar = c;
        }
        
        if (res.length() != s.length()) {
            return "";
        }
        
        return res.toString();
    }
}
