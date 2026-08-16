# -*- coding: utf-8 -*-
import sys
import array
import time
import math
import heapq
import bisect
import itertools
import random
import re
import operator
import string
import datetime
import collections
import json
import sortedcontainers
from functools import *
from collections import *
from heapq import *
from bisect import *
from sortedcontainers import SortedDict, SortedList, SortedSet

sys.setrecursionlimit(10**6)

with open("test.json", "r") as _test_json_file:
    _TEST_ = json.load(_test_json_file)

def _test_val(case_id, name):
    return _TEST_[case_id][name]["val"]

${SOLUTION}

${UTILITIES}

${INSERTION}
