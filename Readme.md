### In development

Activate venv
```
source venv/bin/activate  
# On Windows: venv\Scripts\activate
```

To run 
```
$ pip install -r requirements.txt
$ pip install -e .
$ bro
$ bro --help
```

## NOTE: DON'T RUN ON WINDOWS

Most packages including mythril can't install on [Windows Cmd](https://github.com/Consensys/mythril/issues/1790#issuecomment-1657196639)

### TODO must create docker container & image
system ubuntu 18
python 3.9
check [Working_Output](./Working_Output.md)