EQ_TAG, NEQ_TAG, EMPTY_TAG = 1, 0, -1


class _const:
    class ConstError(PermissionError):
        pass

    class ConstCaseError(ConstError):
        pass

    def __setattr__(self, name, value):
        if name in self.__dict__:
            raise self.ConstError("Can't change const {0}".format(name))
        self.__dict__[name] = value


LLModel = _const()
LLModel.__setattr__('C3', 'C3')
LLModel.__setattr__('DIN_SQL', 'DIN-SQL')
LLModel.__setattr__('DAIL_SQL', 'DAIL-SQL')
LLModel.__setattr__('RESD_natsql', 'RESD_natsql')
LLModel.__setattr__('RESD_sql', 'RESD_sql')
LLModel.__setattr__('T5', 'T5')
LLModel.__setattr__('Gemma_7b', 'Gemma_7b')



def is_gpt_based(model) -> bool:
    return model in [LLModel.C3, LLModel.DIN_SQL, LLModel.DAIL_SQL]


def is_opensource_llm_based(model) -> bool:
    return model in [LLModel.RESD_natsql, LLModel.RESD_sql]


def is_pre_trained_llm_based(model) -> bool:
    return model in [LLModel.T5, LLModel.Gemma_7b]


benchmark_type = _const()
benchmark_type.__setattr__('spider', 'spider')
benchmark_type.__setattr__('bird', 'bird')
benchmark_type.__setattr__('beaver', 'beaver')

dataset_type = _const()
dataset_type.__setattr__('train', 'train')
dataset_type.__setattr__('dev', 'dev')
dataset_type.__setattr__('test', 'test')


sql_equiv_mode = _const()
sql_equiv_mode.__setattr__('syntax', 'syntax')
sql_equiv_mode.__setattr__('exec', 'exec')
sql_equiv_mode.__setattr__('solve', 'solve')
sql_equiv_mode.__setattr__('mixed', 'mixed')


refine_steps = _const()
refine_steps.__setattr__('original', 'original')
refine_steps.__setattr__('gold_checked', 'gold_checked')
