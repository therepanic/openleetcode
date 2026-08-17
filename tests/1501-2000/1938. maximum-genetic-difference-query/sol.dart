class TrieNode1938 {
  int count = 0;
  Map<int, TrieNode1938> child = {};
}

class BitTrie1938 {
  TrieNode1938 root = TrieNode1938();

  void increase(int number, int delta) {
    TrieNode1938 cur = root;
    for (int i = 17; i >= 0; i--) {
      int bit = (number >> i) & 1;
      cur.child.putIfAbsent(bit, () => TrieNode1938());
      cur = cur.child[bit]!;
      cur.count += delta;
    }
  }

  int findMax(int number) {
    TrieNode1938 cur = root;
    int answer = 0;
    for (int i = 17; i >= 0; i--) {
      int bit = (number >> i) & 1;
      int desired = 1 - bit;
      if (cur.child.containsKey(desired) && cur.child[desired]!.count > 0) {
        cur = cur.child[desired]!;
        answer |= 1 << i;
      } else {
        cur = cur.child[bit]!;
      }
    }
    return answer;
  }
}

class Solution {
  List<int> maxGeneticDifference(List<int> parents, List<List<int>> queries) {
    int n = parents.length;
    List<List<int>> children = List.generate(n, (_) => <int>[]);
    int root = 0;
    for (int i = 0; i < n; i++) {
      if (parents[i] == -1) {
        root = i;
      } else {
        children[parents[i]].add(i);
      }
    }
    BitTrie1938 trie = BitTrie1938();
    Map<int, List<List<int>>> grouped = {};
    for (int i = 0; i < queries.length; i++) {
      grouped.putIfAbsent(queries[i][0], () => <List<int>>[]).add([i, queries[i][1]]);
    }
    List<int> answer = List.filled(queries.length, 0);
    void dfs(int node) {
      trie.increase(node, 1);
      for (List<int> query in grouped[node] ?? <List<int>>[]) {
        answer[query[0]] = trie.findMax(query[1]);
      }
      for (int child in children[node]) {
        dfs(child);
      }
      trie.increase(node, -1);
    }
    dfs(root);
    return answer;
  }
}
