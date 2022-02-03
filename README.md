# State-specific projection of COVID-19 infection

The source code for the paper [S. Chen, Q. Li, S. Gao, Y. Kang, X. Shi. State-specific projection of COVID-19 infection in the United States and evaluation of three major control measures. Scientific Reports volume 10, Article number: 22429 (2020)](https://www.nature.com/articles/s41598-020-80044-3).

## Organization

The repo root contains a code for model parameter inference using the Ensemble Kalman Filter and a code to convert the .csv/.txt data to .mat data.

- `src`: contains the ODE model solvers with and without the proactive control measure (See (1) and (4) in the supporting material)

The run time could be between several minutes to several hours depending on the parameters you choose, e.g., the time step size and the number of states.

## Instructions for use

1. Run raw2mat.m, which will generate .mat data used in the model parameter inference stage
2. Run EKF_analysis.m to infer the model parameters by making use of the daily confirmed cases data

## Cite this work

If you use this code for academic research, you are encouraged to cite the following paper:

```
@article{ChLiGaKaSh:2020state,
  title={State-specific projection of {COVID}-19 infection in the {U}nited {S}tates and evaluation of three major control measures},
  author={Chen, Shi and Li, Qin and Gao, Song and Kang, Yuhao and Shi, Xun},
  journal={Scientific reports},
  volume={10},
  number={1},
  pages={1--9},
  year={2020},
  publisher={Nature Publishing Group}
}
```

## Questions

To get help on how to use the data or code, simply open an issue in the GitHub "Issues" section.