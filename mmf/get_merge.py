#!/usr/bin/python3

#@File: get_merge.py

#-*-coding:utf-8-*-

#@Author:Guan_pc

#@Time: 2020年09月26日13时

#说明:
import argparse

import pandas as pd
import os

paths = []
def find_csv(file):
    files = os.listdir(file)
    for i in files:
        path = f'{file}/{i}'
        if '.csv' in i:
            paths.append(path)
        elif os.path.isdir(path):
            find_csv(path)

def func(file,test_num):
    print(file)
    find_csv(file)
    data_dfs = []
    for path in paths:
        data = pd.read_csv(path)
        if data.shape[0] == test_num and "mean_submission" not in path:
            print(path)
            data_dfs.append(data)

    data = data_dfs[0]
    proba_mean = sum([i['proba'] for i in data_dfs])/len(data_dfs)
    label_sub = [int(proba > 0.5) for proba in proba_mean]
    data['proba'] = proba_mean
    data['label'] = label_sub
    data.to_csv(f'{file}/mean_submission_{str(test_num)}.csv',index= False)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--file_path", type=str, required=True)
    parser.add_argument("--num", type=int, default=2000, required=False)
    args = parser.parse_args()
    func(args.file_path,test_num=args.num)
