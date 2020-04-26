Generate kubernetes manifest and configmap
===
Run command:
```
python3.7 DAG-parser.py DAG.json
```
This generates the manifest and all the configmaps needed according to the DAG specified in DAG.json.

Then enter the `test` folder. Use `sudo make build` to launch the cluster and `sudo make destroy` to destroy it.