class Solution {
  List<int> smallestSufficientTeam(
    List<String> req_skills,
    List<List<String>> people,
  ) {
    final skillIndex = <String, int>{};
    for (var i = 0; i < req_skills.length; i++) {
      skillIndex[req_skills[i]] = i;
    }

    final personMasks = <int>[];
    for (final skills in people) {
      var mask = 0;
      for (final skill in skills) {
        final index = skillIndex[skill];
        if (index != null) mask |= 1 << index;
      }
      personMasks.add(mask);
    }

    final best = <int, List<int>>{0: <int>[]};
    for (var person = 0; person < personMasks.length; person++) {
      final current = Map<int, List<int>>.from(best);
      for (final entry in current.entries) {
        final combined = entry.key | personMasks[person];
        if (combined == entry.key) continue;
        final candidate = <int>[...entry.value, person];
        final existing = best[combined];
        if (existing == null || candidate.length < existing.length) {
          best[combined] = candidate;
        }
      }
    }
    return best[(1 << req_skills.length) - 1]!;
  }
}
