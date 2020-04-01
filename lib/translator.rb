require 'pry'
require "yaml"

def load_library(data)
  hash = {}
  files = YAML.load_file('./lib/emoticons.yml')
  files.each do |emotions, symbols|
    hash[emotions] = {:english => symbols[0], :japanese => symbols[1]}
  end 
  return hash
end

def get_japanese_emoticon(file = "./lib/emoticons.yml", english)
  data = load_library(file)
  data.each do |emotions, symbols|
    data[emotions].each do |symbols, japanese|
       if data[emotions][symbols].include?(english)
       return data[emotions][:japanese]
      end
    end 
  end
  return "Sorry, that emoticon was not found"
end 
 
def get_english_meaning(file = "./lib/emoticons.yml", japanese)
  data = load_library("./lib/emoticons.yml")
  data.each do |emotions, symbols|
    data[emotions].each do |symbols, english|
      if data[emotions][symbols].include?(japanese)
        return emotions
      end
    end 
  end
  return "Sorry, that emoticon was not found"
end 