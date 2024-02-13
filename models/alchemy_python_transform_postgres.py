# -*- coding: utf-8 -*-
"""
Created on Tue Feb 13 18:47:04 2024

@author: camer
"""

# PostgreSQL python transformation for superset analysis

import pandas as pd

def model(dbt, session):
    
    #create frame
    frame = dbt.source()

    #dunno, might need, might not
    pd.set_option('display.expand_frame_repr', False)
    
    #remove unneeded columns
    frame.drop('value', axis=1, inplace=True)
    frame.drop('weight', axis=1, inplace=True)
    frame.drop('_airbyte_ab_id', axis=1, inplace=True)
    frame.drop('_airbyte_emitted_at', axis=1, inplace=True)
    frame.drop('_airbyte_normalized_at', axis=1, inplace=True)
    frame.drop('_airbyte_ingredients_hashid', axis=1, inplace=True)

    #replace None with 0 and 'x' with 1.
    frame = frame.replace([None,'x'],[0,1])

    #create new reshaped dataframe for output
    final_frame=pd.DataFrame(columns=['ingredients','effect 1','effect 2','effect 3','effect 4'])

    #add rows using logic magic stuff
    for row in range(len(frame.index)):
        new_row = [frame['ingredient'][row]]
        column_number = 0
        for value in frame.iloc[row]:
            if value == 1:
                new_row.append(frame.columns[column_number])
            column_number += 1
        while len(new_row) < 5:
            new_row.append("")
        final_frame.loc[row] = new_row
     
    
    return final_frame


