# Instructions

### 1. Download/Copy contents of [tester](https://github.com/pregram/Testers/blob/main/ex0/part1/tester) file from github to your personal computer

### 2. Upload the file to the terminal by clicking on New SFTP window.

  <img src="https://github.com/pregram/Testers/blob/main/ex0/part1/Images/SFTP_guide.png"
  style="width: 10%; height: 10%;"/>

### 3. Be sure to add the file under part1 directory/folder 

<img src="https://github.com/pregram/Testers/blob/main/ex0/part1/Images/ChosingPart1Folder.png"
  style="width: 50%; height: 50%;"/>
  
<img src="https://github.com/pregram/Testers/blob/main/ex0/part1/Images/SFTP_Uploading_Tester.png"
  style="width: 50%; height: 50%;"/>

### 4. Enter in the terminal window change the directory to where the tester file is

### 5. check that tester file is there and use `chmod +x tester` to allow the file's execution

### 6. run the tester `./tester`

<img src="https://github.com/pregram/Testers/blob/main/ex0/part1/Images/Using_Tester.png"
  style="width: 50%; height: 50%;"/>
  
## Process

- ### The tester asks you if you want to update `mtm_tot` if answered y it uses `gcc ..`

- ### Running tests 

- ### Summary: failed tests out of total

- ### The tester can remove the additional tests and the tester file itself

> ## Notes
> 
> ### The tester file assumes the following (and checks if they exist):
> - #### Exe file for `part1.c` is `mtm_tot` if it isn't then it will notify you and create it instantly
> - #### The 4 given tests are in `part1` directory otherwise it won't run the tests
> - #### There exists a `mtm_sol` executable file it otherwise won't run additional tests
> - #### `part1.c` exists if not it won't proceed with testing 
>
> ### Don't use it in another folder might delete something from the terminal
>
> ### The tester doesn't check memory leaks
> 
