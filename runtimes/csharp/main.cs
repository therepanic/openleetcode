#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;
using System.IO;
using Newtonsoft.Json.Linq;

${SOLUTION}

${UTILITIES}

partial class _Runner {
    class _TestInput {
        public JToken val { get; set; }
    }

    static Dictionary<string, Dictionary<string, _TestInput>> _TEST_;

    static JToken _TestVal(string caseId, string name) {
        return _TEST_[caseId][name].val;
    }

    public static void Main() {
        _TEST_ = JObject.Parse(File.ReadAllText("test.json"))
            .Properties()
            .ToDictionary(
                caseProp => caseProp.Name,
                caseProp => ((JObject)caseProp.Value).Properties().ToDictionary(
                    varProp => varProp.Name,
                    varProp => new _TestInput { val = varProp.Value["val"] }
                )
            );
        ${INSERTION}
    }
}
