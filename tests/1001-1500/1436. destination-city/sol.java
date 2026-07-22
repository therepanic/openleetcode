class Solution {
    public String destCity(List<List<String>> paths) {
        Set<String> startCities = new HashSet<>();
        
        for (List<String> path : paths) {
            startCities.add(path.get(0));
        }
        
        for (List<String> path : paths) {
            if (!startCities.contains(path.get(1))) {
                return path.get(1);
            }
        }
        
        return "";
    }

    // The local harness materializes nested arrays for this parameter.
    public String destCity(String[][] paths) {
        Set<String> startCities = new HashSet<>();

        for (String[] path : paths) {
            startCities.add(path[0]);
        }

        for (String[] path : paths) {
            if (!startCities.contains(path[1])) {
                return path[1];
            }
        }

        return "";
    }
}
