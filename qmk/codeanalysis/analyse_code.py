from __future__ import annotations
from collections import Counter, defaultdict
from pathlib import Path
from dataclasses import dataclass, fields
import os
import pandas as pd
import json

from pandas.io.common import dataclasses


@dataclass
class File:
    filename: str
    language: str
    num_lines: int
    char_count: Counter

    @classmethod
    def from_filepath(cls, filepath: str):
        language = filepath.split(".")[-1]
        with open(filepath, encoding="utf-8") as f:
            code_file: str = f.read()
            char_count = Counter(code_file)
            num_lines = sum(1 for _ in f)
        filename = filepath.split("/")[-1]
        return cls(filename, language, num_lines, char_count)

    def to_pd_row(self) -> pd.Series:
        return pd.Series(
            [self.filename, self.language, self.num_lines, self.char_count]
        )


class Book:
    def __init__(self, include_list: Path | None = None) -> None:
        self.files: list[File] = []
        self.extension_count = defaultdict(int)
        if include_list is not None:
            self.ext_include_list = json.load(open(include_list))
        else:
            self.ext_include_list = None

    def accepted_extension(self, filepath: str) -> bool:
        if self.ext_include_list == None:
            return True
        file_ext = filepath.split(".")[-1].lower()
        for ext in self.ext_include_list:
            if ext == file_ext:
                return True
        else:
            return False

    def add_file(self, filepath: str):
        if self.accepted_extension(filepath):
            try:
                self.files.append(File.from_filepath(filepath))
            except:
                return
            self.extension_count[filepath.split(".")[-1]] += 1

    def add_subdir_files(self, root_path: Path | str):
        for subdir, _, files in os.walk(root_path):
            for filename in files:
                self.add_file(os.path.join(subdir, filename))

    def to_dataframe(self) -> pd.DataFrame:
        unique_symbols = []
        for file in self.files:
            unique_symbols.extend(list(file.char_count.keys()))
            
        print(sorted(set(unique_symbols)))
        return

        df = pd.DataFrame(columns=["filename", "language", "num_lines", "char_count"])
        for file in self.files:
            df = df.append(file.to_pd_row(), ignore_index=True)
        return df


if __name__ == "__main__":
    repos_path = Path("./repos")
    book = Book(Path("./inclusion_list.json"))
    book.add_subdir_files(repos_path)
    df = book.to_dataframe()
    # df.to_csv("counts.csv")

