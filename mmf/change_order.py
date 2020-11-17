#!/usr/bin/python3

#@File: change_order.py

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

def func(file,stand_file = 'stand.csv'):
    print(file)
    stand = pd.read_csv(stand_file)
    find_csv(file)
    path = paths[0]
    for path in paths:
        data_df = pd.read_csv(path)
        if data_df.shape[0] == stand.shape[0]:
            w = stand.merge(data_df,how='left',on = 'id')
            out_df = pd.DataFrame({'id':w['id'], 'proba':w['proba_y'], 'label':w['label_y'], })
            out_df.to_csv(path,index= False)
if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--file_path", type=str, required=True)
    parser.add_argument("--stand_file", type=str, required=True)
    args = parser.parse_args()
    func(args.file_path,args.stand_file)
