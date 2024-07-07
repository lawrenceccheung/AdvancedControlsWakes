#!/bin/sh

export TEMPLATE=LowWS_LowTI_oneturb_template.ipynb

export CONFIGSCRIPT=baseline.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_baseline.ipynb

export CONFIGSCRIPT=WM_Helix_A2_St_0p3.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WM_Helix_A2_St_0p3.ipynb

export CONFIGSCRIPT=WM_Helix_A4_St_0p3.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WM_Helix_A4_St_0p3.ipynb

export CONFIGSCRIPT=WM_Pulse_A2_St_0p3.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WM_Pulse_A2_St_0p3.ipynb

export CONFIGSCRIPT=WM_Pulse_A4_St_0p3.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WM_Pulse_A4_St_0p3.ipynb

export CONFIGSCRIPT=WM_SideToSide_A2_St_0p3.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WM_SideToSide_A2_St_0p3.ipynb

export CONFIGSCRIPT=WM_SideToSide_A4_St_0p3.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WM_SideToSide_A4_St_0p3.ipynb

export CONFIGSCRIPT=WS_m10.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WS_m10.ipynb

export CONFIGSCRIPT=WS_m20.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WS_m20.ipynb

export CONFIGSCRIPT=WS_p10.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WS_p10.ipynb

export CONFIGSCRIPT=WS_p20.py
jupyter nbconvert --to notebook --execute $TEMPLATE --output LowWS_LowTI_oneturb_WS_p20.ipynb

