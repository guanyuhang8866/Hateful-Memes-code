#!/usr/bin/python3

#@File: kFold_split.py

#-*-coding:utf-8-*-

#@Author:Guan_pc

#@Time: 2020年10月09日11时

#说明:
import json

from sklearn.model_selection import KFold

def read_jsonl(file):
    data = [json.loads(i) for i in open(file, 'r', encoding='utf-8')]
    return data

def write_jsonl(data,name,train = True):
    with open(f'{name}.jsonl','w', encoding = 'utf-8') as f:
        if train:
            for i in data:
                w = i.copy()
                w['label'] = 0.005 if w['label'] == 0 else 0.995
                f.write(json.dumps(w)+'\n')
        else:
            [f.write(json.dumps(i)+'\n') for i in data]

k = 9
train_data_file = 'train.jsonl'
dev_data_file = 'dev_unseen.jsonl'

kfold = KFold(n_splits=k, shuffle=True, random_state=1)
train_df = read_jsonl(train_data_file)
dev_df = read_jsonl(dev_data_file)
all_data = train_df + dev_df
print(len(all_data))
index = kfold.split(X=all_data)
for k, (train_index, test_index) in enumerate(index):
    print(f'K_flod:{k}')
    train_data = [all_data[i]for i in train_index]
    dev_data = [all_data[i]for i in test_index]
    print(len(train_data), len(dev_data))
    write_jsonl(train_data,f'train_source{k}', train = False)
    write_jsonl(dev_data,f'dev_source{k}', train = False)
