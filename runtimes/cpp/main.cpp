#include <bits/stdc++.h>
#include <nlohmann/json.hpp>
${IMPORTS}
using namespace std;

${UTILITIES}

${SOLUTION}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  ifstream _TEST_JSON_FILE_("test.json");
  _JSON_ _TEST_JSON_;
  _TEST_JSON_FILE_ >> _TEST_JSON_;
  map<string, map<string, _TEST_> > _TEST_DATA_;
  for (auto& [caseId, caseJson] : _TEST_JSON_.items()) {
    _TEST_DATA_[caseId] = caseJson.get<map<string, _TEST_> >();
  }
  ${INSERTION}
  return 0;
}
