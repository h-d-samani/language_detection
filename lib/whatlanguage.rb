class WhatLanguage

  @@data = {}
  
  def initialize(options = {})
    #languages_folder = File.join(File.dirname(__FILE__), "..", "lang")
    languages_folder = "lang"
    # Dir.entries(languages_folder).grep(/\.lang/).each do |lang|    
    Dir.glob("#{languages_folder}/**/*").grep(/\.lang/).each do |lang|
      file_name = lang[/\w+\.lang/]
      @@data[file_name[/\w+/].to_sym] ||= File.new(lang, 'rb').read.downcase.gsub!(/(;|\.|:|,)/," ")
    end
  end
  
  # Proccess the text by searching in all available languages to the application.
  def process_text(text)
    debugger
    results = Hash.new(0)
    it = 0
    text.split.collect {|a| a.downcase }.each do |word|
      it += 1
      @@data.keys.each do |lang|
        results[lang] += 1 if @@data[lang].include?(word)
      end
      
      # If we have a convincing result, exit.
      if it % 4 == 0 && results.size > 1
        top_results = results.sort_by{|a,b| b}.reverse[0..1]        
        
        break if top_results[0][1] > 4 && ((top_results[0][1] > top_results[1][1] * 2) || (top_results[0][1] - top_results[1][1] > 25))
      end
      
      #break if it > 100
    end
    results
  end
  
  def language(text)        
    process_text(text).max { |a,b| a[1] <=> b[1] }.first rescue nil
  end  
  
end

class String
  def language
    WhatLanguage.new(:all).language(self)
  end
end