ECHO OFF
python -m pip install --upgrade pip --user
python -m pip install databricks-cli --user
python -m pip install pexpect --user
REM cp d:/local/appdata/python/python36/scripts/databricks.exe .
REM cp d:/local/appdata/python/python36/scripts/dbfs.exe .
git clone https://github.com/Prateekagarwal9/supplychain-new
python expect.py %1 %2
databricks workspace delete -r /Supply-Chain-Solution
databricks workspace import  -f DBC -l SCALA supplychain/Supply-Chain-Solution.dbc /Supply-Chain-Solution
rmdir /q /s supplychain-new
databricks fs rm -r dbfs:/databricks
databricks fs mkdirs dbfs:/databricks/init/SupplyChain/
databricks fs cp arima_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp prophet_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp holtwinter_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp lstm_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp xgboost_installation.sh dbfs:/databricks/init/SupplyChain/
databricks fs cp or_installation.sh dbfs:/databricks/init/SupplyChain/
ECHO OFF
REM databricks jobs create --json-file arima.json > runid.json
REM jq-win64.exe ".job_id" runid.json > jobid.txt
REM set /p jobid= < jobid.txt
REM databricks jobs run-now --job-id %jobid%
REM databricks jobs create --json-file prophet.json > runid.json
REM jq-win64.exe ".job_id" runid.json > jobid.txt
REM set /p jobid= < jobid.txt
REM databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file holtwinter.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
databricks jobs create --json-file xgboost.json > runid.json
jq-win64.exe ".job_id" runid.json > jobid.txt
set /p jobid= < jobid.txt
databricks jobs run-now --job-id %jobid%
REM databricks jobs create --json-file lstm.json > runid.json
REM jq-win64.exe ".job_id" runid.json > jobid.txt
REM set /p jobid= < jobid.txt
REM databricks jobs run-now --job-id %jobid%
REM databricks jobs create --json-file or.json > runid.json
REM jq-win64.exe ".job_id" runid.json > jobid.txt
REM set /p jobid= < jobid.txt
REM databricks jobs run-now --job-id %jobid%
