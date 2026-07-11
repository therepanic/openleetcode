import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashSet;
import java.util.Set;

class Solution {
    public int kSimilarity(String s1, String s2) {
        Deque<String> queue = new ArrayDeque<>();
        queue.offer(s1);
        Set<String> seen = new HashSet<>();
        int answ = 0;
        
        while (!queue.isEmpty()) {
            int size = queue.size();
            for (int k = 0; k < size; k++) {
                String string = queue.poll();
                if (string.equals(s2)) {
                    return answ;
                }
                
                int i = 0;
                while (string.charAt(i) == s2.charAt(i)) {
                    i++;
                }
                
                for (int j = i + 1; j < string.length(); j++) {
                    if (string.charAt(i) == s2.charAt(j) && s2.charAt(j) != s1.charAt(j)) {
                        String newStr = string.substring(0, i) + string.charAt(j) + 
                                       string.substring(i + 1, j) + string.charAt(i) + 
                                       string.substring(j + 1);
                        if (!seen.contains(newStr)) {
                            seen.add(newStr);
                            queue.offer(newStr);
                        }
                    }
                }
            }
            answ++;
        }
        return answ;
    }
}
