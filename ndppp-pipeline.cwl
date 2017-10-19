#!/usr/bin/env cwl-runner
# cwltool --preserve-environment=DYLD_LIBRARY_PATH --preserve-environment=PATH ndppp-pipeline.cwl ndppp-pipeline-input.yml

cwlVersion: v1.0
class: Workflow
inputs:
  measurement_set: Directory

outputs:
  averaged_measurement_set:
    type: Directory
    outputSource: average/msout

steps:
  justcopy:
    run: ndppp.cwl
    in:
      msin: measurement_set
    out: [msout]

  average:
    run: ndppp-avg.cwl
    in:
      msin: justcopy/msout
    out: [msout]
