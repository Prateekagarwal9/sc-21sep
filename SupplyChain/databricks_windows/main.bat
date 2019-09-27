ECHO OFF 
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
databricks jobs create --json-file prophet.json > runid1.json
jq-win64.exe ".job_id" runid1.json > jobid1.txt
set /p jobid1= < jobid1.txt
databricks jobs run-now --job-id %jobid1%
databricks jobs create --json-file holtwinter.json > runid2.json
jq-win64.exe ".job_id" runid2.json > jobid2.txt
set /p jobid2= < jobid2.txt
databricks jobs run-now --job-id %jobid2%
databricks jobs create --json-file xgboost.json > runid3.json
jq-win64.exe ".job_id" runid3.json > jobid3.txt
set /p jobid3= < jobid3.txt
databricks jobs run-now --job-id %jobid3%
databricks jobs create --json-file lstm.json > runid4.json
jq-win64.exe ".job_id" runid4.json > jobid4.txt
set /p jobid4= < jobid4.txt
databricks jobs run-now --job-id %jobid4%
databricks jobs create --json-file or.json > runid5.json
jq-win64.exe ".job_id" runid5.json > jobid5.txt
set /p jobid5= < jobid5.txt
databricks jobs run-now --job-id %jobid5%
databricks jobs create --json-file os.json > runid6.json
jq-win64.exe ".job_id" runid6.json > jobid6.txt
set /p jobid6= < jobid6.txt
databricks jobs run-now --job-id %jobid6%
databricks jobs create --json-file timefence.json > runid7.json
jq-win64.exe ".job_id" runid7.json > jobid7.txt
set /p jobid7= < jobid7.txt
databricks jobs run-now --job-id %jobid7%
