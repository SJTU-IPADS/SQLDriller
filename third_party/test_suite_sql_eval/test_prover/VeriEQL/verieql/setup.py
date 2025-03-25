# -*- coding: utf-8 -*-

import glob
import os
import shutil
from distutils.core import setup

from Cython.Build import cythonize


def find_files(dir):
    if os.path.isdir(dir):
        out = []
        for subdir in os.listdir(dir):
            subdir = os.path.join(dir, subdir)
            subdir = find_files(subdir)
            if isinstance(subdir, list):
                out += subdir
            elif isinstance(subdir, str):
                out.append(subdir)
        return out
    elif os.path.isfile(dir) and str.endswith(dir, ".py"):
        return dir


FILES = [
    "visitors/visitor.py",
    "verifiers/bag_semantics_verifier.py",
    "verifiers/list_semantics_verifier.py",
    "verifiers/verifier.py",
]

setup(
    name="VeriEQL",
    version="0.2",
    author="Yang He*, Pinhan Zhao*, Xinyu Wang, Yuepeng Wang (* equal contribution)",
    ext_modules=cythonize(FILES),
)

for file in FILES:
    c_file = file[:-2] + 'c'
    os.remove(c_file)
    prefix, suffix = file.split('.')
    so_file = list(glob.glob(f'{prefix}.*.so'))[0]
    os.rename(so_file, file[:-2] + 'so')
    os.remove(file)

import compileall

FILES = [
            "environment.py",
            "context.py",
            "constants.py",
            "encoder.py",
            "scope.py",
            "utils.py"
        ] + find_files("formulas")
for file in FILES:
    compileall.compile_file(file)
    dst_dir = os.path.dirname(file)
    prefix, suffix = os.path.basename(file).split('.')
    compiled_file = f'{prefix}.*.pyc'
    pyc_file = list(glob.glob(os.path.join(dst_dir, "__pycache__", compiled_file)))[0]
    dst_file = os.path.join(os.path.dirname(file), f"{prefix}.pyc")
    shutil.copyfile(pyc_file, dst_file)
    os.remove(file)
