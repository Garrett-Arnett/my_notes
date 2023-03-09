from env import host, user, password
from pydataset import data
import pandas as pd 
import os

# Helper Function (To gain connection to SQL database)
def get_connection(db, user=user, host=host, password=password):
    '''
    This function uses my info from my env file to
    create a connection url to access the Codeup db.
    '''
    return f'mysql+pymysql://{user}:{password}@{host}/{db}'

# Make a function named get_titanic_data that returns the titanic data from the codeup 
# data science database as a pandas data frame. Obtain your data from the Codeup Data 
# Science Database.

def get_titanic_data(cached=False):
    '''
    This function reads the titanic data from the Codeup db into a df,
    write it to a csv file, and returns the df.
    '''
    if os.path.exists('titanic.csv'):
        df = pd.read_csv('titanic.csv', index_col=0)
    
    else:
        query = 'select * from passengers'
        connection = get_connection('titanic_db')
        df = pd.read_sql(query, connection)
        df.to_csv('titanic.csv')
    # Create SQL query.
    return df
    

# Make a function named get_iris_data that returns the data from the iris_db on the codeup 
# data science database as a pandas data frame. The returned data frame should include the 
# actual name of the species in addition to the species_ids. Obtain your data from the Codeup 
# Data Science Database.

def get_iris_data(cached=False):
    '''
    This function reads the titanic data from the Codeup db into a df,
    write it to a csv file, and returns the df.
    '''
    # Create SQL query.
    sql_query = """
                SELECT species_id,
                species_name,
                sepal_length,
                sepal_width,
                petal_length,
                petal_width
                FROM measurements
                JOIN species
                USING(species_id)
                """
    
    # Read in DataFrame from Codeup db.
    df = pd.read_sql(sql_query, get_connection('iris_db'))
    
    return df






def get_telco_data():
    if os.path.exists('telco.csv'):
        return pd.read_csv('telco.csv', index_col=0)
    else:
        telco_df = pd.read_sql(
            '''
            SELECT 
                * 
            FROM 
                customers 
                LEFT JOIN internet_service_types USING(internet_service_type_id)
                LEFT JOIN payment_types USING(payment_type_id)
                LEFT JOIN contract_types USING(contract_type_id)
            ''', env.get_db_url('telco_churn')
        )
        telco_df.to_csv('telco.csv')
        return pd.read_csv('telco.csv', index_col=0)


# Converting titanic_db to local csv
    df.to_csv('titanic_df.csv')
    os.path.isfile('titanic_df.csv')

# Converting iris_db to local csv
    df.to_csv('iris_df.csv')
    os.path.isfile('iris_df.csv')

# Converting telco_db to local csv
    df.to_csv('telco.csv')
    os.path.isfile('telco.csv')