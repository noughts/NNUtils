#!/usr/bin/env python

import commands;
import os;



def runCommand( command ):
	print "$ "+ command;
	os.system( command );
	pass


def getVersion():
	import json;
	projectName = os.getcwd().split("/")[-1];
	result_str = commands.getoutput("pod ipc spec %s.podspec" % projectName)
	# print result_str;
	dict = json.loads( result_str );
	return dict["version"];


version = getVersion();
runCommand( "git tag "+ version );
runCommand( "git push --tags" );
runCommand( "pod repo push noughts" );
