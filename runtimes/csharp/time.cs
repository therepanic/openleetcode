#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;

${SOLUTION}

${UTILITIES}

partial class _Runner {
    public static void Main() {
        var sw = Stopwatch.StartNew();
        ${CALL_SOLUTION};
        sw.Stop();
        Console.Write(sw.ElapsedMilliseconds);
    }
}
