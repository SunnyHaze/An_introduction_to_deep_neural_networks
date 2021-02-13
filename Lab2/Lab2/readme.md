# Lab 2 - Feedforward Computation

## Information

* Course: Understanding Deep Neural Networks
* Teacher: Zhang Yi
* Student:
* ID:



#########################################################################################################################

PS： 1, You are allowed to use any programming language(e.g matlab, python and so on) but any deep learning framework ！
        2, Don't need to worry about your computer can not meet computation requirement , every assignment of this course can be ran on any PC with CPU!
        3, Please submit your code before deadline!

##########################################################################################################################



## Files
* `Assignment_redraw.pptx` - power point file for understanding standard form of neural network 
* `main_c.m` - the MATLAB code file for XOR-worms example. Please fill it with component implement
* `fc_c.m` - the MATLAB code file for feedforward computation in component form
* `main_v.m` - the MATLAB code file for XOR-worms example. Please fill it with vector implement
* `fc_v.m` - the MATLAB code file for feedforward computation in vector form

## Instructions

### Task 0: Redraw the networks to standard form
in `Assignment_redraw.pptx`, modify the tow networks on this PPT page directly

### Task 1: Implement the forward computation of FNN in component form
1. in `fc_c.m`, add external inputs with value 1
2. in `fc_c.m`, calculate net input for each neuron
3. in `fc_c.m`, calculate activation for each neuron
4. in `main_c.m`, calculate the activation a2, call function fc_c
5. in `main_c.m`, calculate the activation a3, call function fc_c

### Task 2: Implement the forward computation of FNN in vector form
1. in `fc_v.m`, add external inputs with value 1
2. in `fc_v.m`, calculate net input for all neurons
3. in `fc_v.m`, calculate activation for each neurons
4. in `main_v.m`, calculate the activation a2, call function fc_v
5. in `main_v.m`, calculate the activation a3, call function fc_v

## Submission

* Submit all (5) `.m, .pptx` files in a zip file.
* Submit to email address of TA (scudeeplearning@163.com)
* Use email title:
    ```
    DNN2020F Lab2 <student-id> <student-name>
    ```
    (Don't keep `<`, `>`, `&gt;`, or `&lt;` in the title. Just fill in your student id and your name.)
    TA will be using a filter to **throw away** any email not following such format.
* Deadline: 2020/09/23 23:59
