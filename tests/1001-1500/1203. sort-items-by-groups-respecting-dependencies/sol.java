import java.util.*;

class Solution {
    public int[] sortItems(int n, int m, int[] group, int[][] beforeItems) {
        int nextGroup = m;
        for (int i = 0; i < n; i++) if (group[i] == -1) group[i] = nextGroup++;
        List<List<Integer>> itemGraph = new ArrayList<>();
        List<List<Integer>> groupGraph = new ArrayList<>();
        int[] itemIn = new int[n], groupIn = new int[nextGroup];
        for (int i = 0; i < n; i++) itemGraph.add(new ArrayList<>());
        for (int i = 0; i < nextGroup; i++) groupGraph.add(new ArrayList<>());
        for (int item = 0; item < n; item++) for (int before : beforeItems[item]) {
            itemGraph.get(before).add(item); itemIn[item]++;
            if (group[before] != group[item]) { groupGraph.get(group[before]).add(group[item]); groupIn[group[item]]++; }
        }
        List<Integer> itemOrder = topo(itemGraph, itemIn);
        List<Integer> groupOrder = topo(groupGraph, groupIn);
        if (itemOrder.size() != n || groupOrder.size() != nextGroup) return new int[0];
        List<List<Integer>> grouped = new ArrayList<>();
        for (int i = 0; i < nextGroup; i++) grouped.add(new ArrayList<>());
        for (int item : itemOrder) grouped.get(group[item]).add(item);
        int[] answer = new int[n]; int k = 0;
        for (int g : groupOrder) for (int item : grouped.get(g)) answer[k++] = item;
        return answer;
    }
    private List<Integer> topo(List<List<Integer>> graph, int[] indegree) {
        ArrayDeque<Integer> queue = new ArrayDeque<>();
        for (int i = 0; i < indegree.length; i++) if (indegree[i] == 0) queue.add(i);
        List<Integer> order = new ArrayList<>();
        while (!queue.isEmpty()) { int node = queue.remove(); order.add(node); for (int next : graph.get(node)) if (--indegree[next] == 0) queue.add(next); }
        return order;
    }
}
