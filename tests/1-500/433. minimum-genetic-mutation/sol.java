class Solution {
    public int minMutation(String startGene, String endGene, String[] bank) {
        Set<String> s = new HashSet<>(Arrays.asList(bank));
        if (!s.contains(endGene) && !startGene.equals(endGene)) return -1;
        Queue<String> queue = new LinkedList<>();
        Set<String> v = new HashSet<>();
        queue.add(startGene);
        v.add(startGene);
        int d = 0;
        char[] choices = {'A', 'C', 'G', 'T'};
        while (!queue.isEmpty()) {
            int size = queue.size();
            for (int k = 0; k < size; k++) {
                String g = queue.poll();
                if (g.equals(endGene)) return d;
                for (int i = 0; i < 8; i++) {
                    for (char c : choices) {
                        if (g.charAt(i) != c) {
                            String n = g.substring(0, i) + c + g.substring(i+1);
                            if (s.contains(n) && !v.contains(n)) {
                                v.add(n);
                                queue.add(n);
                            }
                        }
                    }
                }
            }
            d++;
        }
        return -1;
    }
}
