#To dump the json into files
import json
#To execute the main shell script (main.sh)
import subprocess
import logging
import os
logger = logging.getLogger(__name__)


list_json=["arima","prophet","holtwinter","lstm","xgboost","operational_research","os","timefence"]

scripts=["arima_installation.sh","prophet_installation.sh","holtwinter_installation.sh","lstm_installation.sh","xgboost_installation.sh","or_installation.sh","or_installation.sh","or_installation.sh"]

notebooks=["1. Inventory Optimization and Sales Forecasting - ARIMA","2. Demand Forecasting - Prophet","3. Sales Forecasting - Holt Winter","4. LSTM + RNN - Demand and Sales Forecasting","5. Sales & Demand Forecasting - XgBoost","6. Operational Research","7. Opportunity Scoring","8. Time fence"]

jsons=["arima.json","prophet.json","holtwinter.json","lstm.json","xgboost.json","or.json","os.json","timefence.json"]

length_notebooks=len(notebooks)

try:
	def main(databricks_instance, databricks_token, scopename):
		#Details of the cluster and notebooks assigned to variables
		for i in range(length_notebooks):
			clusters_name = "SupplyChain"
			list_json[i] = {
			    "name": "SparkPi Python job",
			    "new_cluster": {
				"name": clusters_name,
				"spark_version": "5.4.x-conda-scala2.11",
				"node_type_id": "Standard_DS3_v2",
				"num_workers": 1,

				"init_scripts": [
				    {
				        "dbfs": {
				            "destination": "dbfs:/databricks/init/SupplyChain/" + scripts[i]
				        }
				    }
				]
			    },
			    "notebook_task": {
				"notebook_path": "/Supply-Chain-Solution/"+notebooks[i],
				"base_parameters": {
				    "scope": scopename

				}
			    }
			}

		print(databricks_instance, databricks_token)

		#Dumping the json into respective files
		for i in range(length_notebooks):
			path="d:/home/site/wwwroot/"+jsons[i]
			with open(path, 'w') as fp:
			    json.dump(list_json[i], fp)

		try:
			with open("d:/home/site/wwwroot/SupplyChain/databricks_windows/errorstry1.txt",'w') as datile:
				datile.write("You did write the json. Now executing the main batch script")
			
			os.environ['PATH'] = os.environ['PATH'] + "D:\\Program Files\\Git\\bin"
			os.system("d:/home/site/wwwroot/SupplyChain/databricks_windows/main1.bat")
			os.environ['PATH'] = os.environ['PATH'] + "D:\\home\\site\\wwwroot\\SupplyChain\\databricks_windows"
			os.system("d:/home/site/wwwroot/SupplyChain/databricks_windows/main.bat {} {}".format(databricks_instance,databricks_token))
			with open("data.txt",'w') as datafile:
				datafile.write("print")	
					
		except Exception as e:
			with open("d:/home/site/wwwroot/SupplyChain/databricks_windows/errorstry2.txt",'w') as datile:
				datile.write("except block of .....You did write the json. Now executing the main batch script")
			print("Error in executing main shell script!!", e)
		
	
	
except Exception as e:
    print(e)
    print("Incorrect parameters in the main function")
