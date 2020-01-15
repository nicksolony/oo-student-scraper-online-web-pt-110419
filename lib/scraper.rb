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
#    if doc.css("div.social-icon-container a")[0] != nil
#      twitter = doc.css("div.social-icon-container a")[0].attribute("href").text
#    else
#      twitter = ""
#    end
#    
#    if doc.css("div.social-icon-container a")[1] != nil
#      linkedin = doc.css("div.social-icon-container a")[1].attribute("href").text
#    else
#      linkedin = ""
#    end
#    
#    if doc.css("div.social-icon-container a")[2] != nil
#      github = doc.css("div.social-icon-container a")[2].attribute("href").text
#    else
#      github = ""
#    end
#    
#    if doc.css("div.social-icon-container a")[3] != nil
#      blog = doc.css("div.social-icon-container a")[3].attribute("href").text
#    else
#      blog = ""
#    end
    
    case doc.css("div.social-icon").attribute("src")[0].

    
    
    student = {
    
    #:twitter => doc.css("div.social-icon-container a").first.attribute("href").text,
    :twitter => twitter,
    :linkedin => linkedin,
    :github => github,
    :blog => blog,
    :profile_quote => doc.css("div.profile-quote").text,
    :bio => doc.css("div.description-holder p").text
    }
    
   end

end

# student_id:  student.attribute("id").text.split("-card")
# name: student.css("h4.student-name").text
# location: student.css("p.student-location").text
# profile_url: student.css("a").attribute("href").text