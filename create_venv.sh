#!/usr/bin/env sh

set -e

virtual_env=.amhe_venv

if ! python3 -m virtualenv -p python3 .venv; then
  python3 -m venv $virtual_env
fi

echo 'export PYTHONPATH="$PYTHONPATH:'$(pwd)'/src"' >> $virtual_env/bin/activate

. $virtual_env/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

python -m ipykernel install --user --name=$virtual_env