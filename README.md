# CLRS

## TLDR;
*I'll stop procrastinating and study.*

## Summary
In simple terms, I will save notes and programs I solve as I read this book. Research and links to external content will also be shared.

## Introduction
After many tries of trying to read CLRS the coveted book for competitive programmers and computer science enthusiasts in general, I have decided that enough was enough. Before my university education ends I will conquer CLRS.

With around 8 months remaining until my graduation I believe that I can conquer this book within a month or two with enough education. After completing 2 internships @ Google (Chrome-Security team and GCP-Network-Reachability team) and 1 Microsoft internship remaining (VSCode-Compilers team) in this summer, along with my job at a startup as a backend-dev && dev-ops && security engineer @ Airtm... I believe that I have procrastinated enough and that my current experiences in coding and solving problems would give me an advantage in better understanding the materials (at least more than the previous attempts).

## Crisis
It is also important to note that this project was started since COVID-19 is finally attacking everyone around the world. Because of this I have received home-office along with home-school in order to fight this pandemic. Whilst being alone and as I started to get my shit together I was more and more irritated by my attitude and started to complete this task.

## Tools
Since this is a very ambitious project, I will also be using very ambitious tools. The following sections explain the program and simple commands to run/visualize or setup the environment I currently have (at the time of writing).

### Markdown
For markdown visualization I would recommend the use of ```grip```.

I personally have downloaded grip through ubuntu's package manager by running ```sudo apt install grip```.
To run ```grip```, just run ```grip README.md``` and it should be available in *localhost:6419*...

### Basic texts
For basic texts, I will be using ```groff```. If you want more information I would recommend a simple tutorial by Luke Smith in the following link:
 https://www.youtube.com/watch?v=w8EKH_fjmXA

```groff/troff``` usually comes along with most *nix distros. However I have noticed that the ```groff``` included in my Ubuntu package-manager is not the widely-used version. Therefore, if the following command does not work, you will have to run ```sudo apt install groff``` in order to get the latest version.

```groff -ms ./test.ms -T pdf > test.pdf``` should output a test pdf file.

