# bat-building-occupation
Data and code for publication by Lunn et al. (2024) in Frontiers in Ecology and the Environment.

ABSTRACT

Identifying areas and drivers of high-risk interfaces for human-wildlife interaction is crucial for managing zoonotic disease risk. We suggest that continent-wide improvement to African housing is inadvertently creating roosting habitat for synanthropic free-tailed bats (family Molossidae), and that improved buildings are a rapidly accelerating exposure interface that needs urgent attention and investment. We mapped building use by free-tailed bats from 1109 buildings along a residential gradient in rural southern Kenya. We show that bats frequently roost in human-occupied buildings; almost one-in-ten buildings showed evidence of bat occupation (9.2%), and one-in-13 were active roosts (7.6%). We identified modern-build style and triangular roofing as building-level predictors of bat occupation, and the proportion of modern buildings as a landscape-level predictor of bat occupancy. Ethical pre-emptive exclusion of bats (by sealing bat entrance points) and restoration of natural roosting habitats should be prioritized as One Health land-use planning strategies in rural Africa. 

DESCRIPTION OF THE DATA AND FILE STRUCTURE

Methods are described in full in manuscript main text and supporting information. Content is divided into Main Text, and Supporting Information, reflecting content within the publication.

Main Text:
- Building-level attributes of bat building use are modelled as the response in building occupation relative to 1) building type (modern or other), and 2) roof structure (triangular or other).
- Landscape-level attributes of bat-human exposure risk are modelled as the response in the number of occupied buildings per site, relative to 1) total number of buildings available, 2) proportion of buildings that were modern-build, and 3) proportion of buildings with a triangular roof.

Supporting Information:

Given the specific interest in the transition from traditional- to modern-style housing, all analyses were repeated on a subset of data that included traditional- and modern-style houses only, and houses with triangle and flat roofing only. Model format is as described above.

Data & results

All data needed to reproduce code are provided as .csv files. Note, however, that building coordinates have been redacted for home owner privacy, from *building_features_spatial.csv *and SI_building_features_spatial.csv. Model outputs have been provided as .RDS files.

Main Text:
- Building-level attributes of bat building use: building_features_spatial.csv , building-fit-spatial.RDS
- Landscape-level attributes of bat-human exposure risk: plot_features_direct.csv , plot-fit-direct-spatial.RDS
- Landscape-level attributes of bat-human exposure risk (active roosts): plot_features_occ4.csv , plot-fit-occ4-spatial.RDS

Supporting Information:
- Building-level attributes of bat building use: SI_building_features_spatial.csv , SI_building-fit-spatial.RDS
- Landscape-level attributes of bat-human exposure risk: SI_plot_features_direct.csv , SI_plot-fit-direct-spatial.RDS
- Landscape-level attributes of bat-human exposure risk (active roosts): SI_plot_features_occ4.csv , SI_plot-fit-occ4-spatial.RDS

SHARING/ACCESS INFORMATION

Please contact the corresponding author for more information about sharing/access of data: tamika.lunn@uga.edu

CODE/SOFTWARE

Annotated code is available within the R File (Lunn et al 2024_model code.R). Content is divided into Main Text, and Supporting Information, reflecting content within the publication. There is no novel code (new functions or packages).
