class Solution {
    public int rectangleArea(int[][] rectangles) {
        final int OPEN = 0, CLOSE = 1;
        int MOD = (int)1e9 + 7;
        List<int[]> events = new ArrayList<>();
        for (int[] r : rectangles) {
            int x1 = r[0], y1 = r[1], x2 = r[2], y2 = r[3];
            events.add(new int[]{y1, OPEN, x1, x2});
            events.add(new int[]{y2, CLOSE, x1, x2});
        }
        events.sort((a, b) -> Integer.compare(a[0], b[0]));
        
        long res = 0;
        int cur_y = events.get(0)[0];
        List<int[]> active = new ArrayList<>();
        
        for (int[] event : events) {
            int y = event[0], typ = event[1], x1 = event[2], x2 = event[3];
            
            long q = 0;
            int cur = -1;
            active.sort((a, b) -> Integer.compare(a[0], b[0]));
            for (int[] seg : active) {
                q += Math.max(0, seg[1] - Math.max(cur, seg[0]));
                cur = Math.max(cur, seg[1]);
            }
            
            res = (res + q * (y - cur_y)) % MOD;
            cur_y = y;
            
            if (typ == OPEN) {
                active.add(new int[]{x1, x2});
            } else {
                for (int i = 0; i < active.size(); i++) {
                    int[] seg = active.get(i);
                    if (seg[0] == x1 && seg[1] == x2) {
                        active.remove(i);
                        break;
                    }
                }
            }
        }
        
        return (int)res;
    }
}
