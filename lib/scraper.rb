require 'open-uri'
require 'pry'
#require 'nokogiri'


class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    
    students = []
    
    
    doc.css("div.student-card").each { |student| 
    
      name = student.css("h4.student-name").text
      location = student.css("p.student-location").text
      profile_url = student.css("a").attribute("href").text
      student_id = student.attribute("id").text.to_sym
      students << { 
        :name => name,
        :location=> location,
        :profile_url => profile_url
      }
    
    #  students[student_id.to_sym] = {
    #    :name => student.css("h4.student-name").text,
    #    :location => student.css("p.student-location").text,
    #    :profile_url => student.css("a").attribute("href").text      
    #  }.to_a
    }

    students
  #  binding.pry
  end

  def self.scrape_profile_page(profile_url)
     doc = Nokogiri::HTML(open(profile_url))
    binding.pry
    student = {
    
    :twitter => doc.css("div.social-icon-container a").first.attribute("href").text,
    :linkedin => doc.css("div.social-icon-container a").first.attribute("href").text,
    #:github =>,
    #:blog =>,
    #:profile_quote =>,
    #:bio =>
    }
    
   end

end

# student_id:  student.attribute("id").text.split("-card")
# name: student.css("h4.student-name").text
# location: student.css("p.student-location").text
# profile_url: student.css("a").attribute("href").text