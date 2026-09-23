import pandas as pd
import glob as glob
import os
import pandas_gbq

a=glob.glob(r'C:\Users\Tanvir\Downloads\archive (5)\*.csv')

for data in a:
    x=pd.read_csv(data)
    x.columns=x.columns.str.replace(r'[\.\s\(\)]+','_',regex=True).str.strip('_')
    file_name=os.path.basename(data).replace('.csv','')
    new_name=os.path.join(f'extracted_{file_name}')

    project_name='elite-vista-474514-t0'
    dataset_name='instacart_raw'
    table_name=new_name
    full_path=f'{dataset_name}.{new_name}'

    pandas_gbq.to_gbq(
        x,
        project_id=project_name,
        destination_table=full_path,
        if_exists='append'

    )