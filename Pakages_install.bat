@echo off
echo Installing Python Pakages

python -m pip install --upgrade pandas numpy matplotlib seaborn scikit-learn scipy statsmodels jupyter jupyterlab jupyter-git
python -m pip install --upgrade jupyterlab jupyterlab-git
pause