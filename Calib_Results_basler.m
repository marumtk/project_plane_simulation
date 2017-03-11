% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1025.445205035535100 ; 1016.691715761037100 ];

%-- Principal point:
cc = [ 211.096633207055480 ; 284.749301441032800 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.211356081581930 ; 0.313722129728813 ; 0.001039711113550 ; -0.015000922960563 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 19.548478933849292 ; 18.901935344076012 ];

%-- Principal point uncertainty:
cc_error = [ 29.215470627535474 ; 17.385966176890221 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.064247740327751 ; 0.301515763583267 ; 0.003379915172057 ; 0.006346922176170 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 26;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.133490e+00 ; 1.772600e+00 ; 2.895682e-01 ];
Tc_1  = [ -4.775059e+01 ; -1.733260e+02 ; 9.998442e+02 ];
omc_error_1 = [ 1.930257e-02 ; 1.880686e-02 ; 3.547664e-02 ];
Tc_error_1  = [ 2.876492e+01 ; 1.709284e+01 ; 2.023938e+01 ];

%-- Image #2:
omc_2 = [ 2.406361e+00 ; 1.624074e+00 ; 3.570676e-01 ];
Tc_2  = [ -8.293991e+01 ; -5.741918e+01 ; 9.834575e+02 ];
omc_error_2 = [ 2.168659e-02 ; 1.371604e-02 ; 4.026037e-02 ];
Tc_error_2  = [ 2.820501e+01 ; 1.676726e+01 ; 1.957058e+01 ];

%-- Image #3:
omc_3 = [ 2.126524e+00 ; 1.472964e+00 ; 6.219911e-01 ];
Tc_3  = [ -1.452681e+02 ; -9.284247e+01 ; 8.982950e+02 ];
omc_error_3 = [ 2.004453e-02 ; 1.586633e-02 ; 3.211150e-02 ];
Tc_error_3  = [ 2.603390e+01 ; 1.537059e+01 ; 1.880645e+01 ];

%-- Image #4:
omc_4 = [ -1.579986e+00 ; -1.708999e+00 ; 5.473018e-01 ];
Tc_4  = [ 1.738254e+02 ; -1.969173e+02 ; 1.152885e+03 ];
omc_error_4 = [ 1.911792e-02 ; 2.162391e-02 ; 3.053634e-02 ];
Tc_error_4  = [ 3.318479e+01 ; 1.997532e+01 ; 2.148665e+01 ];

%-- Image #5:
omc_5 = [ -1.922334e+00 ; -1.390501e+00 ; 6.470398e-02 ];
Tc_5  = [ 4.900646e+01 ; -2.135672e+02 ; 1.362669e+03 ];
omc_error_5 = [ 1.680332e-02 ; 1.838233e-02 ; 3.682624e-02 ];
Tc_error_5  = [ 3.915445e+01 ; 2.345330e+01 ; 2.536831e+01 ];

%-- Image #6:
omc_6 = [ 2.241450e+00 ; 1.952564e+00 ; -8.750545e-01 ];
Tc_6  = [ 1.166630e+02 ; -8.527988e+01 ; 1.384427e+03 ];
omc_error_6 = [ 1.718837e-02 ; 1.977749e-02 ; 4.527471e-02 ];
Tc_error_6  = [ 3.950253e+01 ; 2.372241e+01 ; 2.436518e+01 ];

%-- Image #7:
omc_7 = [ 2.292663e+00 ; 1.570258e+00 ; 2.038700e-01 ];
Tc_7  = [ -1.653579e+02 ; -6.107325e+01 ; 1.031603e+03 ];
omc_error_7 = [ 2.050861e-02 ; 1.679650e-02 ; 3.641347e-02 ];
Tc_error_7  = [ 2.972739e+01 ; 1.764185e+01 ; 2.078878e+01 ];

%-- Image #8:
omc_8 = [ 2.383976e+00 ; 1.970054e+00 ; -3.085178e-01 ];
Tc_8  = [ 4.744047e+01 ; -1.607237e+02 ; 1.389296e+03 ];
omc_error_8 = [ 3.011421e-02 ; 2.635365e-02 ; 6.136731e-02 ];
Tc_error_8  = [ 3.972667e+01 ; 2.380661e+01 ; 2.596363e+01 ];

%-- Image #9:
omc_9 = [ 2.101980e+00 ; 2.149199e+00 ; 1.413548e-01 ];
Tc_9  = [ 3.972111e+01 ; -1.345415e+02 ; 7.564079e+02 ];
omc_error_9 = [ 1.935174e-02 ; 1.866237e-02 ; 4.060408e-02 ];
Tc_error_9  = [ 2.167000e+01 ; 1.295241e+01 ; 1.490998e+01 ];

%-- Image #10:
omc_10 = [ 2.055492e+00 ; 1.819298e+00 ; 7.924168e-01 ];
Tc_10  = [ 2.034838e+01 ; -1.195025e+02 ; 6.573591e+02 ];
omc_error_10 = [ 2.287934e-02 ; 1.678603e-02 ; 3.399599e-02 ];
Tc_error_10  = [ 1.886178e+01 ; 1.119766e+01 ; 1.392611e+01 ];

%-- Image #11:
omc_11 = [ -1.886045e+00 ; -1.902011e+00 ; -2.825411e-01 ];
Tc_11  = [ 8.146857e+01 ; -1.826011e+02 ; 9.767701e+02 ];
omc_error_11 = [ 1.365363e-02 ; 2.104126e-02 ; 4.035140e-02 ];
Tc_error_11  = [ 2.809920e+01 ; 1.685449e+01 ; 1.914478e+01 ];

%-- Image #12:
omc_12 = [ -1.812107e+00 ; -1.661807e+00 ; -6.236762e-01 ];
Tc_12  = [ 3.162602e+01 ; -1.235138e+02 ; 8.584199e+02 ];
omc_error_12 = [ 1.147204e-02 ; 2.028281e-02 ; 3.541557e-02 ];
Tc_error_12  = [ 2.459617e+01 ; 1.468692e+01 ; 1.667354e+01 ];

%-- Image #13:
omc_13 = [ 1.746360e+00 ; 1.847302e+00 ; -5.114528e-01 ];
Tc_13  = [ 5.099104e+01 ; -1.102512e+02 ; 9.294525e+02 ];
omc_error_13 = [ 1.431360e-02 ; 2.164971e-02 ; 3.296577e-02 ];
Tc_error_13  = [ 2.656097e+01 ; 1.593636e+01 ; 1.643404e+01 ];

%-- Image #14:
omc_14 = [ 1.564658e+00 ; 1.505003e+00 ; -4.368312e-01 ];
Tc_14  = [ -1.218004e+01 ; -7.749626e+01 ; 8.539110e+02 ];
omc_error_14 = [ 1.507575e-02 ; 2.237176e-02 ; 2.783078e-02 ];
Tc_error_14  = [ 2.435779e+01 ; 1.457015e+01 ; 1.503788e+01 ];

%-- Image #15:
omc_15 = [ -2.060621e+00 ; -2.153222e+00 ; 2.183307e-01 ];
Tc_15  = [ 5.032726e+01 ; -1.177879e+02 ; 7.949989e+02 ];
omc_error_15 = [ 2.122353e-02 ; 2.415454e-02 ; 4.678285e-02 ];
Tc_error_15  = [ 2.267766e+01 ; 1.367621e+01 ; 1.508273e+01 ];

%-- Image #16:
omc_16 = [ 2.050795e+00 ; 2.053457e+00 ; 1.241930e-01 ];
Tc_16  = [ 2.172831e+01 ; -1.327732e+02 ; 7.457360e+02 ];
omc_error_16 = [ 1.829234e-02 ; 1.884291e-02 ; 3.778577e-02 ];
Tc_error_16  = [ 2.136809e+01 ; 1.276057e+01 ; 1.457694e+01 ];

%-- Image #17:
omc_17 = [ 2.708350e+00 ; 1.612077e+00 ; 1.786962e-01 ];
Tc_17  = [ 5.369274e+01 ; -1.329517e+02 ; 1.046536e+03 ];
omc_error_17 = [ 2.767218e-02 ; 1.408710e-02 ; 5.231183e-02 ];
Tc_error_17  = [ 2.991024e+01 ; 1.791287e+01 ; 2.084129e+01 ];

%-- Image #18:
omc_18 = [ -2.567492e+00 ; -1.175792e+00 ; -4.036833e-01 ];
Tc_18  = [ -2.335275e+01 ; -1.016009e+02 ; 1.000277e+03 ];
omc_error_18 = [ 1.923383e-02 ; 1.385923e-02 ; 4.290777e-02 ];
Tc_error_18  = [ 2.861072e+01 ; 1.702617e+01 ; 1.913286e+01 ];

%-- Image #19:
omc_19 = [ 2.387512e+00 ; 1.403436e+00 ; -8.796247e-02 ];
Tc_19  = [ 6.343348e+01 ; -1.341315e+02 ; 1.066430e+03 ];
omc_error_19 = [ 2.055284e-02 ; 1.589975e-02 ; 4.032427e-02 ];
Tc_error_19  = [ 3.054672e+01 ; 1.831435e+01 ; 2.004366e+01 ];

%-- Image #20:
omc_20 = [ 1.398853e+00 ; 2.603380e+00 ; 2.495540e-01 ];
Tc_20  = [ -2.845846e+01 ; -1.961769e+02 ; 9.696496e+02 ];
omc_error_20 = [ 1.417083e-02 ; 2.548079e-02 ; 4.002893e-02 ];
Tc_error_20  = [ 2.790998e+01 ; 1.658285e+01 ; 1.982251e+01 ];

%-- Image #21:
omc_21 = [ 2.156291e+00 ; 1.019993e+00 ; -1.845101e-01 ];
Tc_21  = [ -5.946442e+00 ; -8.474840e+01 ; 1.077925e+03 ];
omc_error_21 = [ 1.788757e-02 ; 1.765374e-02 ; 3.361146e-02 ];
Tc_error_21  = [ 3.077971e+01 ; 1.840666e+01 ; 1.985024e+01 ];

%-- Image #22:
omc_22 = [ -1.301822e+00 ; -2.495855e+00 ; -6.638198e-01 ];
Tc_22  = [ 9.628714e+01 ; -1.680268e+02 ; 8.489668e+02 ];
omc_error_22 = [ 6.909016e-03 ; 2.410736e-02 ; 3.770339e-02 ];
Tc_error_22  = [ 2.438448e+01 ; 1.463717e+01 ; 1.792650e+01 ];

%-- Image #23:
omc_23 = [ 1.308397e+00 ; 1.704521e+00 ; -2.092178e-01 ];
Tc_23  = [ -3.836456e+01 ; -1.646985e+02 ; 9.647430e+02 ];
omc_error_23 = [ 1.369336e-02 ; 2.492839e-02 ; 2.498503e-02 ];
Tc_error_23  = [ 2.766912e+01 ; 1.651161e+01 ; 1.808994e+01 ];

%-- Image #24:
omc_24 = [ 2.110128e+00 ; 2.161610e+00 ; 1.004750e-01 ];
Tc_24  = [ -5.086181e+01 ; -1.455997e+02 ; 1.225299e+03 ];
omc_error_24 = [ 2.555843e-02 ; 2.672839e-02 ; 5.459549e-02 ];
Tc_error_24  = [ 3.506085e+01 ; 2.095030e+01 ; 2.463248e+01 ];

%-- Image #25:
omc_25 = [ -2.201610e+00 ; -2.163885e+00 ; -2.559933e-02 ];
Tc_25  = [ 6.489775e+01 ; -1.594873e+02 ; 1.429664e+03 ];
omc_error_25 = [ 4.164650e-02 ; 4.467805e-02 ; 9.389881e-02 ];
Tc_error_25  = [ 4.074106e+01 ; 2.449374e+01 ; 2.998212e+01 ];

%-- Image #26:
omc_26 = [ 2.001544e+00 ; 1.854097e+00 ; -1.603383e-01 ];
Tc_26  = [ -2.442849e+00 ; -1.218519e+02 ; 1.038568e+03 ];
omc_error_26 = [ 1.679318e-02 ; 2.045810e-02 ; 3.607229e-02 ];
Tc_error_26  = [ 2.967191e+01 ; 1.777040e+01 ; 1.943842e+01 ];

