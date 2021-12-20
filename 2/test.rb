# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'pathname'

dir = Pathname.new(File.dirname(__FILE__)).realpath
puts dir
ns = dir.split()
puts ns[0]
puts ns[1]
