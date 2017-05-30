#!/usr/bin/python
import os

currentdir=os.getcwd()
files = [x for x in os.listdir(currentdir+str("/Lists")) if x.endswith('.ltxt')]
if (os.path.isdir(str(currentdir)+"/Blue_ToolBox")) is False:
	os.makedir(str(currentdir)+"/Blue_ToolBox")
os.system("cd "+str(currentdir)+ "/Lists")
for filename in files:
	print "--Starting work on "+str(filename)
	dirname= os.path.splitext(str(filename))[0]
	os.system("cd "+str(currentdir)+"/Blue_ToolBox/ && mkdir "+str(dirname))
	f=open(str(currentdir)+ "/Lists/"+str(filename))
	line=f.readline()
	while line:
		os.system("cd "+str(currentdir)+"/Blue_ToolBox/"+str(dirname) +" && "+line)
		line=f.readline()
	f.close()