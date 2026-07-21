class Solution {
private:
    unordered_set<string> unmet_skills;
    int smallest_length = INT_MAX;
    vector<int> current_team;
    vector<int> best_team;
    vector<string> req_skills;
    vector<unordered_set<string>> people_sets;
    unordered_map<string, unordered_set<int>> skills_to_people;

    void meet_skill(int skill) {
        if (unmet_skills.empty()) {
            if (smallest_length > current_team.size()) {
                smallest_length = current_team.size();
                best_team = current_team;
            }
            return;
        }

        if (skill >= req_skills.size() || unmet_skills.find(req_skills[skill]) == unmet_skills.end()) {
            meet_skill(skill + 1);
            return;
        }

        auto& candidates = skills_to_people[req_skills[skill]];
        for (int i : candidates) {
            unordered_set<string> skills_added;
            for (const auto& s : people_sets[i]) {
                if (unmet_skills.count(s)) {
                    skills_added.insert(s);
                }
            }

            for (const auto& s : skills_added) {
                unmet_skills.erase(s);
            }
            current_team.push_back(i);

            meet_skill(skill + 1);

            current_team.pop_back();
            for (const auto& s : skills_added) {
                unmet_skills.insert(s);
            }
        }
    }

public:
    vector<int> smallestSufficientTeam(vector<string>& req_skills, vector<vector<string>>& people) {
        this->req_skills = req_skills;
        int n = people.size();
        people_sets.resize(n);
        for (int i = 0; i < n; i++) {
            for (const auto& s : people[i]) {
                people_sets[i].insert(s);
            }
        }

        // Remove all skill sets that are subset of another skillset
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j) {
                    bool is_subset = true;
                    for (const auto& s : people_sets[i]) {
                        if (people_sets[j].find(s) == people_sets[j].end()) {
                            is_subset = false;
                            break;
                        }
                    }
                    if (is_subset) {
                        people_sets[i].clear();
                    }
                }
            }
        }

        // Build dictionary of skills to the people who can perform them
        for (int i = 0; i < n; i++) {
            for (const auto& skill : people_sets[i]) {
                skills_to_people[skill].insert(i);
            }
        }

        for (const auto& s : req_skills) {
            unmet_skills.insert(s);
        }

        meet_skill(0);
        return best_team;
    }
};
