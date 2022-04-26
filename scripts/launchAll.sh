echo "Insert the name of the process you want to launch:"
read PR
echo "You're reading process " $PR

echo "--- Creating cards ---"
echo "./scripts/setup_process.sh" $PR
./scripts/setup_process.sh $PR

echo "--- Create the config file, param card and reweight card ---"
conf=config_$PR.json
echo $conf
echo "python scripts/make_config.py -p $PR -o $conf --pars SMEFT:7 --def-val 100 --def-sm 0.0 --def-gen 0.0"
python scripts/make_config.py -p $PR -o $conf --pars SMEFT:7 --def-val 100 --def-sm 0.0 --def-gen 0.0

echo "python scripts/make_param_card.py -p $PR -c $conf -o cards/$PR/param_card.dat"
python scripts/make_param_card.py -p $PR -c $conf -o cards/$PR/param_card.dat

echo "python scripts/make_reweight_card.py $conf cards/$PR/reweight_card.dat"
python scripts/make_reweight_card.py $conf cards/$PR/reweight_card.dat


echo "First module production completed" | sendmail -t matteo.magherini@gmail.com

echo "--- Creating the standalone reweighting module---"

./socripts/setup_process_standalone.sh $PR
python scripts/make_standalone.py -p $PR -o rw_$PR -c $conf --rw-dir MG5_aMC_v2_6_7/$PR-standalone

echo "Standalone production completed" | sendmail -t matteo.magherini@gmail.com
