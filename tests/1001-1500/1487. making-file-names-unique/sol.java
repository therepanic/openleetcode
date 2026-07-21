class Solution {
    public String[] getFolderNames(String[] names) {
        Map<String, Integer> nameCount = new HashMap<>();
        String[] result = new String[names.length];
        int idx = 0;

        for (String name : names) {
            if (!nameCount.containsKey(name)) {
                result[idx++] = name;
                nameCount.put(name, 1);
            } else {
                int k = nameCount.get(name);
                while (nameCount.containsKey(name + "(" + k + ")")) {
                    k++;
                }
                String newName = name + "(" + k + ")";
                result[idx++] = newName;
                nameCount.put(name, k + 1);
                nameCount.put(newName, 1);
            }
        }

        return result;
    }
}
