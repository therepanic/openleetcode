class Solution {
  int openLock(List<String> deadends, String target) {
    if (target == "0000") return 0;
    final dead = Set<String>.from(deadends);
    if (dead.contains("0000")) return -1;
    
    int moves = 0;
    final queue = Queue<String>();
    final visited = <String>{"0000"};
    queue.add("0000");
    
    while (queue.isNotEmpty) {
      int size = queue.length;
      for (int k = 0; k < size; k++) {
        String cur = queue.removeFirst();
        if (cur == target) return moves;
        
        for (int i = 0; i < 4; i++) {
          int val = int.parse(cur[i]);
          int up = (val + 1) % 10;
          int down = (val - 1 + 10) % 10;
          
          String nxt1 = cur.substring(0, i) + up.toString() + cur.substring(i + 1);
          String nxt2 = cur.substring(0, i) + down.toString() + cur.substring(i + 1);
          
          if (!dead.contains(nxt1) && !visited.contains(nxt1)) {
            visited.add(nxt1);
            queue.add(nxt1);
          }
          if (!dead.contains(nxt2) && !visited.contains(nxt2)) {
            visited.add(nxt2);
            queue.add(nxt2);
          }
        }
      }
      moves++;
    }
    return -1;
  }
}
