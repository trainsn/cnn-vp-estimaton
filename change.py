#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 12 12:31:50 2018

@author: cad
"""
import os
volume  = ['head', 'vismale', 'head_mri', 'vessel', 'tooth', 'fish', 'foot', 'bonsai', 'bonsai1-LO', 'bonsai2-LO']
color = ['black', 'white']
for v in range(7,10):
    for c in range(2):
        file_path = volume[v] + '_train_' + color[c]
        labels_path = file_path + '/labels.txt'
        file = open(labels_path,'r')
        output_path  = 'labels_' + volume[v] + '_train_' + color[c] + '.txt'
        lof = open(output_path,'w')

        idx = 0
        for line in file.readlines():
            file_name, label = line.split()
            #print(label)
            lof.write("/home/shineng/Elements/tfgan/%s/%s %s\n" %  (file_path, file_name, label))
            idx = idx + 1
        cat_cmd = 'cat ' + output_path + ' >> labels_' + volume[v] + '.txt '
        print(cat_cmd)
        #os.system(cat_cmd)

