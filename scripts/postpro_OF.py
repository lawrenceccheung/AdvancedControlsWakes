#!/usr/bin/env python
#

import argparse
import subprocess

# Get the location where this script is being run
import sys, os
scriptpath = os.path.dirname(os.path.realpath(__file__))
basepath   = os.path.dirname(scriptpath)

# Add basepath to the path
amrwindfedirs = ['../',
                 basepath]
import sys, os, shutil
for x in amrwindfedirs: sys.path.insert(1, x)

# Load ruamel or pyyaml as needed
try:
    import ruamel.yaml
    import ruamel.yaml as yaml
    yaml = ruamel.yaml.YAML(typ='unsafe', pure=True)
    useruamel=True
    loaderkwargs = {'Loader':yaml.RoundTripLoader}
    dumperkwargs = {'Dumper':yaml.RoundTripDumper, 'indent':4, 'default_flow_style':False}
    Loader=yaml.load
except:
    import yaml as yaml
    useruamel=False
    loaderkwargs = {}
    dumperkwargs = {'default_flow_style':False }
    Loader=yaml.safe_load


getdictval = lambda dict, key, default: dict[key] if key in dict else default
    
def extractOF(dictlist, exe='extractOF.sh', exepath='./'):
    for OFfile in dictlist:
        name = OFfile['name']
        OFfilename = OFfile['filename']
        OFvars = OFfile['vars']
        # Optional stuff
        datadir = getdictval(OFfile, 'datadir', '')
        prefix  = getdictval(OFfile, 'prefix', '')

        # Construct the exe string
        runlist = []
        runlist.append(exepath+'/'+exe)
        runlist.append(OFfilename)
        if len(datadir)>0:
            runlist.append('-d')
            runlist.append(datadir)
        if len(prefix)>0:
            runlist.append('-p')
            runlist.append(prefix)
        runlist += OFvars
        print(runlist)
        # run it
        subprocess.run(runlist)
            
    return

# ========================================================================
#
# Main
#
# ========================================================================
if __name__ == "__main__":
    helpstring="Postprocess OpenFAST output file with yaml inputs"
    # Handle arguments
    parser     = argparse.ArgumentParser(description=helpstring)
    parser.add_argument(
        "yamlfile",
        help="YAML file",
        type=str,
    )
    
    args      = parser.parse_args()
    yamlfile  = args.yamlfile

    with open(yamlfile, 'r') as fp:
        yamldict = Loader(fp, **loaderkwargs)
    
    extractOF(yamldict['openfast'], exepath=scriptpath)
