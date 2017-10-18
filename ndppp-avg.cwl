#!/usr/bin/env cwltool
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
      glob: tim2avg.MS
  log:
    type: stdout

arguments:
  - msin=$(inputs.msin.path)
  - msout=tim2avg.MS
  - 'steps=[average]'
  - average.timestep=2
  - checkparset=1
  - showprogress=false
