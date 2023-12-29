###############################################################################
#   Datasets and source codes for INFOCOM'23 (A Close Look at 5G in the Wild: Unrealized Potentials and Implications)
#
###############################################################################

This README is used to introduce our released datasets and source codes by our INFOCOM'23 work: 
“A Close Look at 5G in the Wild: Unrealized Potentials and Implications”.


If you use our datasets and/or codes in your publication, please cite our CoNext'23 paper, 
@inproceedings{liu2023close,
  title={A Close Look at 5G in the Wild: Unrealized Potentials and Implications},
  author={Liu, Yanbing and Peng, Chunyi},
  booktitle={IEEE International Conference on Computer Communications (INFOCOM’23)},
  year={2023}
}

We have conducted 5G measurement study from April 2021 to Jan 2022 with 13 
regions R1-R13 in two cities, Indianapolis and Chicago with three top-tier US 
carriers: AT&T, Verizon and T-Mobile. We run our experiments through MI-LAB 
testbed (http://milab.cs.purdue.edu/).

We mainly run two types of experiments:

(I) Heavy traffic: Repeatedly download bulky files (500MB each) from Google 
Cloud to measure downlink data speed.

(II) Light traffic: Ping Google every second to make radio connection active throughout the experiment.

Both heavy and light traffic experiments are performed via the mperf task in 
MI-LAB and was primarily performed from April 2021 to Jan 2022. 

1) Structure of files

├── dataset
│   ├── raw
│   │   ├── cellset_thput
│   │   │   └── {region}_gps_cellset_thput_0.1_taskround_list_{mccmcn}_{phone model}_{date range}.csv.csv
│   │   ├── rss
│   │   │   └── {region}_raw_rss_taskround_list_{mccmcn}_{phone model}_{date range}.csv.csv
│   │   └── instance
│   │       ├── cause_study
│   │       │   └── instance_final_{date range}_taskround_list_{mccmcn}_{phone model}_all.csv.csv
│   │       ├── disruption
│   │       │   └── instance_final_{date range}_taskround_list_{mccmcn}_{phone model}_all_disruption.csv.csv
│   │       └── delay
│   │           └── instance_delay_{date range}_taskround_list_{mccmcn}_{phone model}_all.csv.csv
│   ├── grid
│   │   ├── {region}_connectivity_ratio_{phone model}_{date range}_{mccmcn}_{grid size}_0_0.csv
│   │   ├── {region}_grid_cell_set_{phone model}_{date range}_{mccmcn}_{grid size}_0_0.csv
│   │   └── {region}_rss_cell_{phone model}_{date range}_{mccmcn}_{grid size}_0_0.csv
│   └── dataset_stat
│       ├── basic_stat_{date range}_{region}.csv
│       ├── cell_list_union_{date range}_{operator}.csv
│       ├── cell_set_list_{date range}_{region}.csv
│       └── channel_list_{date range}_{region}.csv
│
└── figure
    └── ...

Due to the space limit by Github, we compress and move dataset/raw folder to 
https://mssn3.cs.purdue.edu/owncloud/index.php/s/kbHH0YJhzV5BBi4

2) Dataset release and its Descriptions

-------------------------------------------------------------------------------
dataset/raw/cellset_thput: 
Records the serving cellset, GPS, instant downlink throughput per 0.1 second.
-------------------------------------------------------------------------------
dataset/raw/rss:
Records RSRP/RSRQ measurement samples of serving cells or neighboring cells.
-------------------------------------------------------------------------------
dataset/raw/instance/cause_study:
Records instances with unchanged cellsets between handovers, and information of configuration and measurement reports during this instance for root cause study of missed 5G.
-------------------------------------------------------------------------------
dataset/raw/instance/disruption:
Records instances with unchanged cellsets between handovers, and information of disruption and impact time since last handover.
-------------------------------------------------------------------------------
dataset/raw/instance/delay:
Records instances with unchanged cellsets between handovers, and information of 5G cell addition time.
-------------------------------------------------------------------------------
dataset/grid:
Records coverage, 5G connectivity, cellset, and performance per grid. The size of each grid is 0.0005 × 0.0005 in latitude and longitude, approximately, 55m × 45m.
-------------------------------------------------------------------------------
dataset/dataset_stat:
Records dataset stats (duration, distance, channel/cell/cellset number, etc.) in each region.
-------------------------------------------------------------------------------
figure:
Includes plotting scripts (Pgfplots or MATLAB) and used input data of each figure in the paper.
-------------------------------------------------------------------------------
