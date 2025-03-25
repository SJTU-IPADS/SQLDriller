# -*- coding: utf-8 -*-


class ValuesTable():
    def __init__(self, name, rows, attributes=['X', 'Y', 'Z']):
        # why set X, Y, Z cuz for calcite dataset
        # only works for VALUES (XXX) in SQL query parsing
        self.name = name
        self.rows = rows
        self.attributes = attributes[:len(rows[0])]

    def __str__(self):
        return f'{self.name}=({self.attributes}, #{len(self.rows)}: {[[list(col.values())[0] for col in row] for row in self.rows]})'

    def __repr__(self):
        return self.__str__()
