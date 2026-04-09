import datetime as _dt
import time as _time

${SOLUTION}

${JSON_GEN}

_start = int(_time.time() * 1000)
${CALL_SOLUTION}
_end = int(_time.time() * 1000)
print(_end - _start)
