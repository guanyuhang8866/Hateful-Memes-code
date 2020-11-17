#!/usr/bin/python3

#@File: mean_method.py

#-*-coding:utf-8-*-

#@Author:Guan_pc

#@Time: 2020年09月26日13时

import pandas as pd
import json

test_files = ['part2_cc_full','part2_cc_small','part2_cc_half']
df = []
for file in test_files:
    df.append(pd.read_csv(f'{file}/mean_submission.csv'))
data = df[0]
proba_sub = sum([i['proba'] for i in df]) / len(df)
label_sub = [int(proba > 0.5) for proba in proba_sub]
data['proba'] = proba_sub
data['label'] = label_sub
data.to_csv(f'part2_mean_sub.csv', index=False)



