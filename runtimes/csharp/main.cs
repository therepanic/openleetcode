#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;

${SOLUTION}

${UTILITIES}

partial class _Runner {
    public static void Main() {
        Console.WriteLine(ToJson(${CALL_SOLUTION}));
    }
}
