Generate kubernetes manifest and configmap
===
A variable file called `values.tfvars` should be placed in this folder. The following is a template, please replace the values:

 ```
 service_account_key_path = "<full path to the service account key JSON file you generated as a prereq>"
 password = "<Kubernetes API password for use with kubectl>"
 ```

Then run command:
```
python3.7 DAG-parser.py DAG.json
```
This generates the manifest and all the configmaps needed according to the DAG specified in DAG.json.

Then enter the `test` folder. Use `sudo make build` to launch the cluster and `sudo make destroy` to destroy it.

