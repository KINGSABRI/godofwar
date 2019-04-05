# Standard libraries
require 'optparse'
require 'ostruct'
require 'json'
require 'fileutils'

# GodOfWar
require 'godofwar/version'
require 'godofwar/builder'
require 'godofwar/payloads'
require 'godofwar/extensions'
require 'godofwar/utils'

# Gems
require 'zip'

module GodOfWar
  class Error < StandardError; end
  String.class_eval { include Extensions::Core::String }
end
