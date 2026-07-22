import java.util.PriorityQueue;

class Solution {
    public String longestDiverseString(int a, int b, int c) {
        PriorityQueue<int[]> maxHeap = new PriorityQueue<>((x, y) -> y[0] - x[0]);
        StringBuilder res = new StringBuilder();

        if (a > 0) maxHeap.add(new int[]{a, 'a'});
        if (b > 0) maxHeap.add(new int[]{b, 'b'});
        if (c > 0) maxHeap.add(new int[]{c, 'c'});

        while (!maxHeap.isEmpty()) {
            int[] first = maxHeap.poll();
            int count = first[0];
            char ch = (char) first[1];

            int len = res.length();
            if (len >= 2 && res.charAt(len - 2) == ch && res.charAt(len - 1) == ch) {
                if (maxHeap.isEmpty()) {
                    break;
                }
                int[] second = maxHeap.poll();
                int count2 = second[0];
                char ch2 = (char) second[1];
                res.append(ch2);
                count2--;
                if (count2 > 0) {
                    maxHeap.add(new int[]{count2, ch2});
                }
            } else {
                res.append(ch);
                count--;
            }

            if (count > 0) {
                maxHeap.add(new int[]{count, ch});
            }
        }

        return res.toString();
    }
}
