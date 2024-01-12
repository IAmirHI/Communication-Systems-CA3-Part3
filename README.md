# Communication-Systems-CA3-Part3
In this repository, we intend to become familiar with concepts of quantization, distribution functions between correlated and uncorrelated variables, as well as random processes, over the course of a series of processes, through conceptual questions and more advanced simulations.
The purpose of performing this exercise is to review engineering statistics and probability and study pulse modulation. We will also become familiar with pulse modulation and attempt to implement a digital transmitter and receiver with decoding in the presence of noise.
a) Definition of continuous signal and sampling, and construction of discrete signals. In this part we are going to made an analog signal.
![Picture1](https://github.com/IAmirHI/Communication-Systems-CA3-Part3/assets/156466517/f866df02-0937-4000-a999-7144fbe75124)

Then we will take samples of it and defined the samples as the digitaled siganl:
![Picture2](https://github.com/IAmirHI/Communication-Systems-CA3-Part3/assets/156466517/cadab29b-ba60-4d65-b582-a2d71265ad3a)

b) Quantization Level Implementation. In this part we will map the digitaled siganl on 32 quantized levels, which were defined.
![Picture3](https://github.com/IAmirHI/Communication-Systems-CA3-Part3/assets/156466517/448c670c-9847-4376-b2f7-6da73d88cc35)

c) Digital conversion of quantized signals. In this part we will make a set of triangular pulses with domians which is specificed in part b.
![Picture4](https://github.com/IAmirHI/Communication-Systems-CA3-Part3/assets/156466517/8afb5ab6-bdfd-4738-9849-43262e283fb5)

d) Reception of digital signal at the receiver. In this part we will add Gaussian noise to the signal which was made in part before, and then we will sent it to the receiver.
![Picture5](https://github.com/IAmirHI/Communication-Systems-CA3-Part3/assets/156466517/ea2084bb-63bc-404f-a06b-c6b95938ec23)

e) Decoding of the digital signal at the receiver. Now we decode the received signal by using the base pulse signal's energy.
![Picture6](https://github.com/IAmirHI/Communication-Systems-CA3-Part3/assets/156466517/314045dc-e59c-450d-86b5-df0f2a8c81ef)
