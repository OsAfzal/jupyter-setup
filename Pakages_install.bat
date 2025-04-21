@echo off
echo Installing Python Pakages

python -m pip install --upgrade pandas numpy matplotlib seaborn scikit-learn scipy statsmodels npstat jupyter
python -m pip install --upgrade jupyterlab jupyterlab-git
pause
