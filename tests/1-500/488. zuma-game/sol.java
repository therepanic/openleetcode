import java.util.*;

class Solution {
    private String removeSame(String s, int i) {
        if (i < 0) return s;
        int left = i, right = i;
        while (left > 0 && s.charAt(left - 1) == s.charAt(i)) left--;
        while (right + 1 < s.length() && s.charAt(right + 1) == s.charAt(i)) right++;
        int length = right - left + 1;
        if (length >= 3) {
            String newS = s.substring(0, left) + s.substring(right + 1);
            return removeSame(newS, left - 1);
        }
        return s;
    }

    public int findMinStep(String board, String hand) {
        char[] h = hand.toCharArray();
        Arrays.sort(h);
        hand = new String(h);

        Queue<State> q = new LinkedList<>();
        Set<String> visited = new HashSet<>();
        State start = new State(board, hand, 0);
        q.offer(start);
        visited.add(board + "#" + hand);

        while (!q.isEmpty()) {
            State cur = q.poll();
            String currBoard = cur.board;
            String currHand = cur.hand;
            int step = cur.step;

            for (int i = 0; i <= currBoard.length(); i++) {
                for (int j = 0; j < currHand.length(); j++) {
                    if (j > 0 && currHand.charAt(j) == currHand.charAt(j - 1)) continue;
                    if (i > 0 && currBoard.charAt(i - 1) == currHand.charAt(j)) continue;

                    boolean pick = false;
                    if (i < currBoard.length() && currBoard.charAt(i) == currHand.charAt(j)) {
                        pick = true;
                    }
                    if (i > 0 && i < currBoard.length() &&
                        currBoard.charAt(i - 1) == currBoard.charAt(i) &&
                        currBoard.charAt(i) != currHand.charAt(j)) {
                        pick = true;
                    }

                    if (pick) {
                        String newBoard = removeSame(
                            currBoard.substring(0, i) + currHand.charAt(j) + currBoard.substring(i), i
                        );
                        String newHand = currHand.substring(0, j) + currHand.substring(j + 1);
                        if (newBoard.isEmpty()) return step + 1;
                        String key = newBoard + "#" + newHand;
                        if (!visited.contains(key)) {
                            visited.add(key);
                            q.offer(new State(newBoard, newHand, step + 1));
                        }
                    }
                }
            }
        }
        return -1;
    }

    private static class State {
        String board;
        String hand;
        int step;
        State(String b, String h, int s) {
            board = b;
            hand = h;
            step = s;
        }
    }
}
