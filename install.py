#!/usr/bin/python
import os

currentdir=os.getcwd()
if (os.path.isdir(str(currentdir)+"/Blue_ToolBox")) is False:
	os.makedirs(str(currentdir)+"/Blue_ToolBox")
os.chdir(str(currentdir)+ "/Lists")
files = [x for x in os.listdir(currentdir+str("/Lists")) if x.endswith('.txt')]
for filename in files:
	dirname= os.path.splitext(str(filename))[0]
	os.chdir(str(currentdir)+"/Blue_ToolBox/")
	if (os.path.isdir(str(currentdir)+"/Blue_ToolBox/")) is False:
			os.system("rm -rf "+str(dirname))
	os.makedirs(str(currentdir)+"/Blue_ToolBox/"+str(dirname))
	os.chdir(str(currentdir)+"/Blue_ToolBox/"+str(dirname))
	f=open(str(currentdir)+ "/Lists/"+str(filename))
	line=f.readline()
	while line:
		os.system(str(line))
		line=f.readline()
	f.close()
