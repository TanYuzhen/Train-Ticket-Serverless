set -e

buildFunction(){
    func_dir=$1
    runtime=$2
    echo "BUILDING $func_dir..."
    cd $func_dir
    rm -rf .gradle
    owk_function_dir=$(find ./ -name "*owk")
    cd $owk_function_dir
    bash build-action.sh $runtime 2>&1 > /dev/null
    cd ../..
    echo "FINISHED $func_dir"
}


runtime=$1
if [ -z "$runtime" ]; then
    echo "lack of param 'runtime'"
    exit
fi


echo "Part02 FaaS Backend Deployment"
PROJECT_DIR=$(cd $(dirname $0); pwd)
cd src/backend/FaaS/

#### Parallel build
cd Part01/
echo "Part1 function build start"
function_dirs=$(ls)
for func_dir in ${function_dirs[@]}
do   
    buildFunction $func_dir $runtime &
done  
wait
echo "Part1 function build finish"
cd ..

cd Part02/
echo "Part2 function build start"
function_dirs=$(ls)
for func_dir in ${function_dirs[@]}
do   
    buildFunction $func_dir $runtime &
done  
wait
echo "Part2 function build finish"
cd ..

cd Part03/
echo "Part3 function deployment start"
function_dirs=$(ls)
for func_dir in ${function_dirs[@]}
do   
    buildFunction $func_dir $runtime &
done  
wait
echo "Part3 function build finished"
cd ..