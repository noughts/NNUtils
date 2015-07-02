import commands;
import json;
import os;

result_str = commands.getoutput("pod ipc spec NNUtils.podspec ")
json = json.loads( result_str );
version = json["version"];
os.system( "git st" );
