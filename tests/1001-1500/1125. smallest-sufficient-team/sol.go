func smallestSufficientTeam(req_skills []string, people [][]string) []int {
    n := len(people)
    peopleSets := make([]map[string]bool, n)
    for i, skills := range people {
        peopleSets[i] = make(map[string]bool)
        for _, s := range skills {
            peopleSets[i][s] = true
        }
    }

    // Remove all skill sets that are subset of another skillset
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if i != j {
                subset := true
                for s := range peopleSets[i] {
                    if !peopleSets[j][s] {
                        subset = false
                        break
                    }
                }
                if subset {
                    peopleSets[i] = make(map[string]bool)
                }
            }
        }
    }

    // Build dictionary of skills to the people who can perform them
    skillsToPeople := make(map[string]map[int]bool)
    for i, skills := range peopleSets {
        for s := range skills {
            if skillsToPeople[s] == nil {
                skillsToPeople[s] = make(map[int]bool)
            }
            skillsToPeople[s][i] = true
        }
    }

    unmetSkills := make(map[string]bool)
    for _, s := range req_skills {
        unmetSkills[s] = true
    }

    smallestLength := int(^uint(0) >> 1) // max int
    currentTeam := []int{}
    bestTeam := []int{}

    var meetSkill func(int)
    meetSkill = func(skill int) {
        if len(unmetSkills) == 0 {
            if smallestLength > len(currentTeam) {
                smallestLength = len(currentTeam)
                bestTeam = make([]int, len(currentTeam))
                copy(bestTeam, currentTeam)
            }
            return
        }

        if skill >= len(req_skills) || !unmetSkills[req_skills[skill]] {
            meetSkill(skill + 1)
            return
        }

        candidates := skillsToPeople[req_skills[skill]]
        for i := range candidates {
            skillsAdded := make(map[string]bool)
            for s := range peopleSets[i] {
                if unmetSkills[s] {
                    skillsAdded[s] = true
                }
            }

            for s := range skillsAdded {
                delete(unmetSkills, s)
            }
            currentTeam = append(currentTeam, i)

            meetSkill(skill + 1)

            currentTeam = currentTeam[:len(currentTeam)-1]
            for s := range skillsAdded {
                unmetSkills[s] = true
            }
        }
    }

    meetSkill(0)
    return bestTeam
}
