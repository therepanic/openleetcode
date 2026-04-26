from __future__ import annotations
import datetime as _dt
from dataclasses import is_dataclass, asdict
from typing import *
import time as _time

${SOLUTION}

${UTILITIES}

_start = int(_time.time() * 1000)
${CALL_SOLUTION}
_end = int(_time.time() * 1000)
print(_end - _start)
