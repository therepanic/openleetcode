import java.util.*;

class Solution {
    public boolean isSolvable(String[] words, String result) {
        Set<Character> zeroes = new HashSet<>();
        int m = 0;
        for (String word : words) {
            if (word.length() > 1) {
                zeroes.add(word.charAt(0));
            }
            m = Math.max(m, word.length());
        }
        if (m > result.length()) {
            return false;
        }
        Map<Character, Integer> d = new HashMap<>();
        for (String word : words) {
            for (char c : word.toCharArray()) {
                d.put(c, -1);
            }
        }
        for (char c : result.toCharArray()) {
            d.put(c, -1);
        }
        String[] wRev = new String[words.length];
        for (int i = 0; i < words.length; i++) {
            wRev[i] = new StringBuilder(words[i]).reverse().toString();
        }
        String rRev = new StringBuilder(result).reverse().toString();
        int R = rRev.length();
        int N = wRev.length;
        Set<Integer> visited = new HashSet<>();
        for (int i = 0; i < 10; i++) {
            visited.add(i);
        }
        return rec(0, 0, 0, wRev, rRev, d, zeroes, visited, R, N);
    }

    private boolean rec(int wi, int ri, int rem, String[] words, String result,
                        Map<Character, Integer> d, Set<Character> zeroes,
                        Set<Integer> visited, int R, int N) {
        if (ri == R) {
            return rem == 0 && (result.length() == 1 || d.get(result.charAt(R-1)) != 0);
        }
        if (wi == N) {
            if (d.get(result.charAt(ri)) != -1) {
                if (d.get(result.charAt(ri)) != rem % 10) {
                    return false;
                } else {
                    return rec(0, ri+1, rem/10, words, result, d, zeroes, visited, R, N);
                }
            } else if (visited.contains(rem % 10)) {
                int val = rem % 10;
                visited.remove(val);
                d.put(result.charAt(ri), val);
                boolean ret = rec(wi, ri, rem, words, result, d, zeroes, visited, R, N);
                d.put(result.charAt(ri), -1);
                visited.add(val);
                if (ret) return true;
            }
            return false;
        }
        if (words[wi].length() <= ri) {
            return rec(wi+1, ri, rem, words, result, d, zeroes, visited, R, N);
        }
        if (d.get(words[wi].charAt(ri)) != -1) {
            return rec(wi+1, ri, rem + d.get(words[wi].charAt(ri)), words, result, d, zeroes, visited, R, N);
        }
        for (int val = 0; val < 10; val++) {
            if (visited.contains(val) && (val != 0 || !zeroes.contains(words[wi].charAt(ri)))) {
                visited.remove(val);
                d.put(words[wi].charAt(ri), val);
                boolean ret = rec(wi+1, ri, rem + val, words, result, d, zeroes, visited, R, N);
                d.put(words[wi].charAt(ri), -1);
                visited.add(val);
                if (ret) return true;
            }
        }
        return false;
    }
}
