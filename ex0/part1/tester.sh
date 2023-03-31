test="test"
in=".in"
out=".out"
sol=".sol"
# Current directory folder not full path
dir_name=$(basename "$PWD")
req_name='part1'
DOESNT_EXIST=1
UNKNOWN_ERROR=2
if [ $dir_name != $req_name ]; then
    echo "Error: you must be in $req_name but you are in $dir_name"
    exit $DOESNT_EXIST
fi

# Check if given tests exist
total=4
NOT_FOUND='WAS NOT FOUND IN'
for ((i = 1 ; i <= $total ; i++)); do
    input=$test$i$in
    output=$test$i$out
    if [ -z $(ls | grep $input) ]; then
        echo "Error: $input $NOT_FOUND $req_name"
        exit $DOESNT_EXIST
    fi
    if [ -z $(ls | grep $output) ]; then
        echo "Error: $output $NOT_FOUND $req_name"
        exit $DOESNT_EXIST
    fi
done
# check if mtm_tot exists and if it doesnt make it
run_file='mtm_tot'
code_file='part1.c'
NOT_FOUND='WAS NOT FOUND'

if [ -z $(ls | grep $run_file) ]; then
    echo "Error: executable for $code_file $NOT_FOUND"
    echo "Trying to create $run_file executable for $code_file ..."
    if [ -z $(ls | grep $code_file) ]; then
        echo "Error: $code_file $NOT_FOUND"
        echo "make sure that $code_file exists in $req_name folder and try again"
        exit $DOESNT_EXIST
    else
        gcc -std=c99 -Wall -pedantic-errors -Werror -DNDEBUG part1.c -o mtm_tot
        if [ -z $(ls | grep $run_file) ]; then
            echo "Failed to create $run_file"
            exit $UNKNOWN_ERROR
        else
            echo "Successfully created $run_file executable for $code_file "
        fi
    fi
fi
# Ask to update executable
echo "Do you want to update mtm_tot executable (y/n)"
read answer
if [ $answer = 'y' ]; then
    if [ -z $(ls | grep $code_file) ]; then
        echo "Error: $code_file $NOT_FOUND"
        echo "make sure that $code_file exists in $req_name folder and try again"
        exit $DOESNT_EXIST
    else
        gcc -std=c99 -Wall -pedantic-errors -Werror -DNDEBUG part1.c -o mtm_tot
        if [ -z $(ls | grep $run_file) ]; then
            echo "Successfully created $run_file executable for $code_file "
        else
            echo "Failed to create $run_file"
            exit $UNKNOWN_ERROR
        fi
    fi
fi

# Run first set of given tests total = 4
temp_file=tmpout
failed_counter=0
for ((i = 1 ; i <= $total ; i++)); do
    input=$test$i$in
    output=$test$i$out
    ./mtm_tot < $input > $temp_file
    echo Running test $i..
    if [ -z $(diff $output $temp_file) ]; then
        echo "Passed test $i"
    else
        echo "Failed test $i"
        failed_counter=$(($failed_counter+1))
    fi
    echo -e "----------------------------\n"
done
rm $temp_file

# Create tests
tests_fold=testos
mkdir $tests_fold
echo "a directory/folder named: $tests_fold has been created to store tests"
cd $tests_fold

#test 5 ########################################
count=$(($total+1))
echo 0.1 > test$count.in

#test 6 #######################################
count=$(($count+1))
echo -1000009 > test$count.in

#test 7 #######################################
count=$(($count+1))
echo a1 > test$count.in

#test 8 #######################################
count=$(($count+1))
echo a1 > test$count.in
echo 8 >> test$count.in

#test 9 #######################################
count=$(($count+1))
echo 10 > test$count.in
echo 0 1 2 4 8 16 32 64 128 256 >> test$count.in

#test 10 #######################################
count=$(($count+1))
touch test$count.in

#test 11 #######################################
count=$(($count+1))
echo 1 > test$count.in

#test 12 #######################################
count=$(($count+1))
echo 2 4 > test$count.in

#test 13 #######################################
count=$(($count+1))
echo 10 -6 5 4 3 32 256 1024 -1024 -256 0 > test$count.in

#test 14 #######################################
count=$(($count+1))
echo 5 1 1 1 1 1 > test$count.in

#test 15 #######################################
count=$(($count+1))
echo 3 > test$count.in
echo        >> test$count.in
echo 0 >> test$count.in
echo -2 >> test$count.in
echo -64 >> test$count.in
echo 1 >> test$count.in

#test 16 #######################################
count=$(($count+1))
echo 1 1.0 > test$count.in

#test 17 #######################################
count=$(($count+1))
echo 2 1 a1 > test$count.in

#test 18 #######################################
count=$(($count+1))
echo 5 1 2 3.0 4 5 > test$count.in

#test 19 #######################################
count=$(($count+1))
echo 6 -2 2 4 3 -32 35 > test$count.in

#test 20 #######################################
count=$(($count+1))
echo 3 45623145 1048576 -4194304 > test$count.in

#test 21 #######################################
count=$(($count+1))
echo 1 0 > test$count.in

#test 22 #######################################
count=$(($count+1))
echo 1 0.2 > test$count.in
cd ..

# Waiting for another test 

# Writing tests has ended
test="testos/test"
in=".in"
out=".out"
sol=".sol"
# Check if mtm_sol exist
solution_exe='mtm_sol'
if [ -z $(ls | grep $solution_exe) ]; then
    echo "Error: $solution_exe $NOT_FOUND"
    echo "Try again after adding $solution_exe to $req_name"
    exit $DOESNT_EXIST
fi

# Run the tests that have been created
for ((i = 5 ; i <= $count ; i++)); do
    input=$test$i$in
    output=$test$i$out
    solution=$test$i$sol
    ./mtm_tot < $input > $output
    ./mtm_sol < $input > $solution
    echo Running test $i ..
    if [ -z $(diff $solution $output) ]; then
        echo "Passed test $i"
    else
        echo "Failed test $i"
        failed_counter=$(($failed_counter+1))
    fi
    echo -e "----------------------------\n"
done

# Write down number of failed tests out of total number of tests 
echo "Summary: total tests: $count you failed: $failed_counter"

echo "Do you want to delete $tests_fold folder/directory? (y/n)"
read answer
if [ $answer = 'y' ]; then
    rm -r testos/
fi

echo "Do you want to delete tester? (y/n)"
read answer
if [ $answer = 'y' ]; then
    rm tester
fi

