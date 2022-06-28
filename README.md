# A5-1-algorithm-using-Verilog
Implementation of stream cipher A5/1 algorithm in verilog

This repository contains the implementation of A5/1 algorithm to encrypt the images using Verilog.
A5/1 algorithm is a very popular stream cipher used nowadays. You can refer the following links to learn about the working of A5/1 algorithm :- 
- [https://en.wikipedia.org/wiki/A5/1](https://en.wikipedia.org/wiki/A5/1)
- [https://www.cryptographynotes.com/2019/02/symmetric-stream-a5by1-algorithm-linear-feedback-shift-register.html](https://www.cryptographynotes.com/2019/02/symmetric-stream-a5by1-algorithm-linear-feedback-shift-register.html)
- [https://www.youtube.com/watch?v=LgZAI3DdUA4](https://www.youtube.com/watch?v=LgZAI3DdUA4)

**The working process of this repository :-**
- The "txt_to_jpg.py" file is used to create a .txt file which contains pixel values of an image in 8-bit binary format.
- The obtained text file is then passed into the simulation source file of verilog i.e. "Test_bench.v".
- There are 4 Design Modules :-
   3 are for 3 LFSRs and 1 is for getting the majority logic.
- The simulation source returns a text file with the processed image in similar format as the input file.
- Then "jpg_to_txt.py" file is used to create .jpeg file from the text file obtained after simulation.

**Steps that are followed while encrypting an image in Test Bench :-**
- Initialize the LFSRs with zeros.
- Feed the secret key bit by bit ignoring the majority logic. (Secret Key = "HARDWARE")
- After 64 bit secret key, feed the known 22bit public key (bit by bit) ignoring the majority logic.(Public Key = 22’b11_0100_1110_0001_1001_0001)
- Step 3 marks the end of initialization step. Now clock the LFSRs 100 times with Majority Logic. Ignore these outputs.
- Now we start the generation of pseudo random keystream. Clock the LFSRs using Majority Logic and XOR the LSB bits of LFSRs to get single bit key.
- XOR this generated key with the input bit to get the encrypted bit.
- Each bit of every pixel value is used as the input bit one by one to get final image.

An example test image and its respective encrypted image is given in the folder "Example Images".
