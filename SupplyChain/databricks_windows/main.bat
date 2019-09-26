ECHO OFF 
mkdir abhi123
copy D:\home\site\wwwroot\env\Scripts\databricks.exe .
copy D:\home\site\wwwroot\env\Scripts\databricks-script.py .
copy D:\home\site\wwwroot\env\Scripts\dbfs.exe .
D:\home\site\wwwroot\env\Scripts\python.exe D:\home\site\wwwroot\SupplyChain\databricks_windows\expect.py %1 %2
ECHO OFF
databricks workspace import  -f DBC -l SCALA D:\home\site\wwwroot\supplychain-new\Supply-Chain-Solution.dbc /Supply-Chain-Solution
databricks fs rm -r dbfs:/databricks
databricks fs mkdirs dbfs:/databricks/init/SupplyChain/
databricks fs cp SupplyChain/databricks_windows/arima_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp SupplyChain/databricks_windows/prophet_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp SupplyChain/databricks_windows/holtwinter_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp SupplyChain/databricks_windows/lstm_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp SupplyChain/databricks_windows/xgboost_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp SupplyChain/databricks_windows/or_installation.sh dbfs:/databricks/init/SupplyChain/
databricks jobs create --json-file arima.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file prophet.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file holtwinter.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file xgboost.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file lstm.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file or.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file os.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file timefence.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
mkdir abhishek
