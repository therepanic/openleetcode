func smallestSufficientTeam(req_skills []string, people [][]string) []int {
    n := len(req_skills)
    m := len(people)
    
    skillIdx := make(map[string]int)
    for i, skill := range req_skills {
        skillIdx[skill] = i
    }
    
    peopleMask := make([]int, m)
    for i, skills := range people {
        mask := 0
        for _, skill := range skills {
            mask |= 1 << skillIdx[skill]
        }
        peopleMask[i] = mask
    }
    
    for i := 0; i < m; i++ {
        for j := 0; j < m; j++ {
            if i != j && peopleMask[i] != 0 && (peopleMask[i] & peopleMask[j]) == peopleMask[i] {
                peopleMask[i] = 0
                break
            }
        }
    }
    
    skillToPeople := make([][]int, n)
    for i := 0; i < n; i++ {
        skillToPeople[i] = []int{}
    }
    for i := 0; i < m; i++ {
        if peopleMask[i] == 0 {
            continue
        }
        for bit := 0; bit < n; bit++ {
            if (peopleMask[i] & (1 << bit)) != 0 {
                skillToPeople[bit] = append(skillToPeople[bit], i)
            }
        }
    }
    
    unmetSkills := make(map[string]bool)
    for _, skill := range req_skills {
        unmetSkills[skill] = true
    }
    
    smallestLength := int(^uint(0) >> 1)
    var currentTeam []int
    var bestTeam []int
    
    var backtrack func(skill int)
    backtrack = func(skill int) {
        if len(unmetSkills) == 0 {
            if smallestLength > len(currentTeam) {
                smallestLength = len(currentTeam)
                bestTeam = append([]int{}, currentTeam...)
            }
            return
        }
        
        if skill >= n {
            return
        }
        
        if !unmetSkills[req_skills[skill]] {
            backtrack(skill + 1)
            return
        }
        
        for _, i := range skillToPeople[skill] {
            mask := peopleMask[i]
            skillsAdded := []string{}
            for s := range unmetSkills {
                if (mask & (1 << skillIdx[s])) != 0 {
                    skillsAdded = append(skillsAdded, s)
                }
            }
            if len(skillsAdded) == 0 {
                continue
            }
            
            for _, s := range skillsAdded {
                delete(unmetSkills, s)
            }
            currentTeam = append(currentTeam, i)
            
            backtrack(skill + 1)
            
            currentTeam = currentTeam[:len(currentTeam)-1]
            for _, s := range skillsAdded {
                unmetSkills[s] = true
            }
        }
    }
    
    backtrack(0)
    return bestTeam
}
