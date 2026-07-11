class Solution {
    public int[] movesToStamp(String stamp, String target) {
        int m = stamp.length();
        int n = target.length();
        char[] stampArr = stamp.toCharArray();
        char[] targetArr = target.toCharArray();
        
        boolean[] stamped = new boolean[n];
        List<Integer> resultList = new ArrayList<>();
        Queue<Integer> queue = new LinkedList<>();
        
        for (int i = 0; i <= n - m; i++) {
            if (canStamp(targetArr, stampArr, i)) {
                applyStamp(targetArr, m, i);
                queue.offer(i);
                resultList.add(i);
                stamped[i] = true;
            }
        }
        
        while (!queue.isEmpty()) {
            int pos = queue.poll();
            int start = Math.max(0, pos - m + 1);
            int end = Math.min(n - m, pos + m);
            for (int i = start; i <= end; i++) {
                if (canStamp(targetArr, stampArr, i)) {
                    if (!stamped[i]) {
                        applyStamp(targetArr, m, i);
                        queue.offer(i);
                        resultList.add(i);
                        stamped[i] = true;
                    }
                }
            }
        }
        
        for (char c : targetArr) {
            if (c != '?') {
                return new int[0];
            }
        }
        
        int[] result = new int[resultList.size()];
        for (int i = 0; i < result.length; i++) {
            result[i] = resultList.get(resultList.size() - 1 - i);
        }
        return result;
    }
    
    private boolean canStamp(char[] target, char[] stamp, int start) {
        for (int i = 0; i < stamp.length; i++) {
            if (target[start + i] != '?' && target[start + i] != stamp[i]) {
                return false;
            }
        }
        return true;
    }
    
    private void applyStamp(char[] target, int m, int start) {
        for (int i = 0; i < m; i++) {
            target[start + i] = '?';
        }
    }
}
