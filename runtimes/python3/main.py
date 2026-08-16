from __future__ import annotations

import sys
import array
import math
import heapq
import bisect
import time
import itertools
import random
import re
import operator
import string
import decimal
import fractions
import statistics
import datetime
import json
import sortedcontainers

from typing import *
from collections import *
from dataclasses import *
from functools import *
from heapq import *
from bisect import *
from sortedcontainers import SortedDict, SortedList, SortedSet

sys.setrecursionlimit(10**6)

with open("test.json", "r", encoding="utf-8") as _test_json_file:
    _TEST_ = json.load(_test_json_file)

def _test_val(case_id, name):
    return _TEST_[case_id][name]["val"]

${SOLUTION}

${UTILITIES}

${INSERTION}
