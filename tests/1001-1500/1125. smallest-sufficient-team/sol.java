class Solution {
    private Set<String> unmet_skills;
    private int smallest_length = Integer.MAX_VALUE;
    private List<Integer> current_team = new ArrayList<>();
    private List<Integer> best_team = new ArrayList<>();
    private String[] req_skills;
    private List<Set<String>> people_sets;
    private Map<String, Set<Integer>> skills_to_people;

    public int[] smallestSufficientTeam(String[] req_skills, List<List<String>> people) {
        this.req_skills = req_skills;
        int n = people.size();
        people_sets = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            people_sets.add(new HashSet<>(people.get(i)));
        }

        // Remove all skill sets that are subset of another skillset
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j && people_sets.get(j).containsAll(people_sets.get(i))) {
                    people_sets.set(i, new HashSet<>());
                }
            }
        }

        // Build dictionary of skills to the people who can perform them
        skills_to_people = new HashMap<>();
        for (int i = 0; i < n; i++) {
            for (String skill : people_sets.get(i)) {
                skills_to_people.computeIfAbsent(skill, k -> new HashSet<>()).add(i);
            }
        }

        unmet_skills = new HashSet<>();
        for (String skill : req_skills) {
            unmet_skills.add(skill);
        }

        meet_skill(0);

        int[] result = new int[best_team.size()];
        for (int i = 0; i < best_team.size(); i++) {
            result[i] = best_team.get(i);
        }
        return result;
    }

    private void meet_skill(int skill) {
        if (unmet_skills.isEmpty()) {
            if (smallest_length > current_team.size()) {
                smallest_length = current_team.size();
                best_team = new ArrayList<>(current_team);
            }
            return;
        }

        if (skill >= req_skills.length || !unmet_skills.contains(req_skills[skill])) {
            meet_skill(skill + 1);
            return;
        }

        Set<Integer> candidates = skills_to_people.get(req_skills[skill]);
        if (candidates == null) return;

        for (int i : candidates) {
            Set<String> person_skills = people_sets.get(i);
            Set<String> skills_added = new HashSet<>(person_skills);
            skills_added.retainAll(unmet_skills);

            unmet_skills.removeAll(skills_added);
            current_team.add(i);

            meet_skill(skill + 1);

            current_team.remove(current_team.size() - 1);
            unmet_skills.addAll(skills_added);
        }
    }
}
