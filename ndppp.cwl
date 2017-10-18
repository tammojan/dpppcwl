#!/usr/bin/env cwl-runner
# cwltool --preserve-environment=DYLD_LIBRARY_PATH --preserve-environment=PATH ndppp.cwl ndppp-input.yml

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [NDPPP]
stdout: log.txt

inputs:
  msin:
    type: Directory

outputs:
  msout:
    type: Directory
    outputBinding:
      glob: tim2.MS
  log:
    type: stdout

arguments:
  - msin=$(inputs.msin.path)
  - msout=tim2.MS
  - 'steps=[]'
  - checkparset=1
  - showprogress=false
