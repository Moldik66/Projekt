# VHDL project - PWM Based Tone Generator

### Team members

* Knap Denis
* Molák Dominik
* Lysá Barbora

## Theoretical description and explanation

Our main objective was to develop a tone generator using PWM on the audio jack connector of the Nexys A7 FPGA board to produce simple musical tones or melodies. 
Users are able to adjust parameters such as frequency and duration using switches on the Nexys A7-50T board. LEDs offer visual indication of the currently generated tone.

We decided to generate the chromatic scale form C5 to C6, separate tone A4 and the frequency of 1kHz. With this, users can play any melodies they would like and use our board as a musical instrument. 

## Hardware description of demo application
By using switches (SW[0] to SW[15]) embeded on the Nexys A7-50T board, users can generate required tones. LEDs above switches (LED[0] to LED[15]) 
indicate which switch was switched on and what tone is playing. 
For output we are using the mono audio out jack and pins A11 and D12 which represent output for PWM Audio Amplifier. 

Description of switches and notes assigned to them:
| **Switch** | **LED** | **Note** | **Frequency** |
| :---: | :---: | :---: | :---: |
| SW[0] | LED[0] | A4 | 440 Hz |
| SW[1] | LED[1] | - | 1 kHz |
| SW[2] | LED[2] | - | - |
| SW[3] | LED[3] | C6 | 1045.5 Hz |
| SW[4] | LED[4] | B5 | 987.77 Hz |
| SW[5] | LED[5] | A#5 | 932.33 Hz |
| SW[6] | LED[6] | A5 | 880 Hz |
| SW[7] | LED[7] | G#5 | 830.61 Hz |
| SW[8] | LED[8] | G5 | 789.99 Hz |
| SW[9] | LED[9] | F#5 | 739.99 Hz |
| SW[10] | LED[10] | F5 | 698.46 Hz |
| SW[11] | LED[11] | E5 | 659.26 Hz |
| SW[12] | LED[12] | D#5 | 622.25 Hz |
| SW[13] | LED[13] | D5 | 587.33 Hz |
| SW[14] | LED[14] | C#5 | 554.37 Hz |
| SW[15] | LED[15] | C5 | 523.25 Hz |

![Nexys A7-50T](images/nexys.png)


## Software description
For the software part of the project, we used simple_counter source code form laboratory excercises and a PWM_Based_Tone_Genreator. 


The role of the simple counter is to count half periods and full periods of the signal which are then sorted in the pwm base tone generator code by if and else functions. 
PWM base tone generator code regulates how many half periods and full periods will be played with each switch, which determines what kind of frequency will be on the output.     

In the top_level source code we connected these two codes together and assigned each input to the right output for full funcionality. The finalised schematic is visualised here:  
![Wiring Diagram](images/schema.png)

### The PWM Based Tone Generator
This code implements a tone generator based on a pulse width modulated (PWM) signal. Its main purpose is to generate different frequencies of audio tones based on the input signals and the input clock signal.
The PWM_Based_Tone_Generator entity defines the inputs and outputs of the module, including the clock signal (clk), the input signal (sw), the LED output (LED), the tone_out output (tone_out), the count signal input (countin), and the counter reset signal output (countrst).
In the Behavioral architecture, a tone_gen process is implemented that responds to changes in the input signals and generates a PWM signal based on the set tone frequencies. For each input signal sw and corresponding tone frequency, conditions are defined that control the generation of the PWM signal.

Three states are specified for each tone:
1)	Pulse length generates a high level signal.
2)	Interval between pulses generates a low level signal.
3)	The end of the period triggers a counter reset signal.

Each condition is defined by a range of counttin counter values corresponding to a given tone frequency.
Overall, the code is structured to allow different tone frequencies to be generated based on the input signals. This allows the PWM signal to be modulated according to the desired musical tones, which is useful, for example, in the design of electronic musical instruments or sound effects.

[Link to source files]projekt_finalna_verze/PWM_Based_Tone_Generator.srcs/sources_1/new/PWM_Based_Tone_Generator.vhd

### Simple Counter
This code implements a simple counter that increments the value by one for each pulse of the clock signal (clk). In addition, it responds to a reset signal (rst) and an enable signal (en) that controls whether to increment the counter.
The simple_counter entity defines the inputs and outputs of the module, with the input values being the clock signal (clk), the reset signal (rst), and the enable signal (en). The output of the module is the count signal (count) and the simple signal note1.
The Behavioral architecture includes a process that responds to changes in the clock signal. When the reset signal is active (rst='1'), the counter value is set to zero. If the enable signal is active (en='1'), the counter value is incremented by one for each pulse of the clock signal.
The resulting counter value is passed to the count output signal. This counter is useful for simple pulse counting or time tracking in digital systems where event sequences need to be monitored or generated.

[Link to source files]projekt_finalna_verze/PWM_Based_Tone_Generator.srcs/sources_1/new/simple_counter2.vhd

### Clock Enable
This code implements a module to generate a pulse using the clock signal (clk). The module allows to set the pulse period using the generic parameter PERIOD.
The clock_enable entity defines the inputs and outputs of the module, including the input clock signal (clk), the reset signal (rst), and the output pulse signal (pulse). There is also a generic parameter PERIOD that defines the length of the pulse period.
The p_clk_enable process is implemented in the Behavioral architecture to generate a pulse depending on the clock signal and period. If the reset signal is active (rst='1'), the counter is set to zero and the output pulse signal is set to zero.
In the synchronous part of the process, the rising edge of the clock signal is checked. If the reset is active, the counter is set to zero and the pulse signal is set to zero. If the number of periods is equivalent to the defined period PERIOD - 1, the pulse signal is generated for one clock period and the counter is reset. Otherwise, the counter is incremented and the pulse signal remains zero.
This module is useful for generating periodic pulses, for example for synchronizing operation in digital systems where a short pulse needs to be generated at regular intervals.

[Link to source files]projekt_finalna_verze/PWM_Based_Tone_Generator.srcs/sources_1/imports/new/clock_enable.vhd


[Link to source files](projekt_finalna_verze/PWM_Based_Tone_Generator.srcs) 

### Components simulation

Behavioral simulation showcasing the state of the signals when the first switch is turned on:
![Testbench](images/simulacia.png)


## Instructions
As already mentioned, operating the board is easy. By simply turning the switches on and off users can produce notes, tones and molodies according to their own preferences.

[Demonstration video schowcasing funcionality of the board](https://youtube.com/shorts/lQLAUqp4Dtc?si=swuIUwftOgwQgKO7)


## References

1. [Nexys A7 Reference Manual](https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual)
2. [GitHub Repository For The Course](https://github.com/tomas-fryza/vhdl-course/tree/master)
3. [Youtube Video - VHDL Code For 1Hz Frequency Generator](https://www.youtube.com/watch?v=IaEMLoEjr0s)
