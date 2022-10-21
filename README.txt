# Bank_Collapse_Relation

FILE "Lab Experiment Datasets.xlsx" corresponds to experimental data used Figure 1 and Figure 2

FILE "KML" contains detailed information of the 113 Oxbow Lakes along Juruá River (Map data: Google Earth; 4° 49′S, 66° 50′W), which is used in Figure 3b

FILE "Data_Output.m" aims at acquiring X/Y coordinate of points along each Oxbow Lakes 

FILE "UTM Coordinates.xlsx"
Column order
1     Number of point
2     Longitude
3     Latitude
4     X coordinate of Universal Transverse Mercator projection (UTM)
5     Y coordinate of Universal Transverse Mercator projection (UTM)

FILE "Features of individual bends.xlsx" corresponds to data used Figure 4b
Row order
UA-3: considering only fluvial erosion and, hence, neglecting bank collapse
UB-3: modeling continuously bank collapse by amplifying fluvial erosion rate,                            the upper bank heigh is set to 1.5 m
UC-3: taking into account the intermittent nature of bank collapse events employing the novel framework, the upper bank heigh is set to 1.5 m
UC-9: taking into account the intermittent nature of bank collapse events employing the novel framework, the upper bank heigh is set to 5 m

Column order
1     Type of simulation, see above
2     Statistics of the width-normalized half meander intrinsic length (kurtosis)
3-6   Statistics of the half meander sinuosity (mean, variance, skewness, kurtosis)
7-10  Statistics of the half meander asymmetry index (mean, variance, skewness, kurtosis)

FILE "PCA analysis.R" aims to do Principal Component Analysis

FILE "Finotello2020.xlsx" is derived from Finotello et al. (Sci.Rep., 2020), https://doi.org/10.1038/s41598-019-56992-w
