class WhatLanguage
  def initialize
    languages_folder = File.join(File.dirname(__FILE__),"lang")
    Dir.entries(languages_folder).each do |lang|      
      debugger
    end    
    puts languages_folder    
  end
  
  def language
    return "Result"
  end
end