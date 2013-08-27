desc "Get the Restaurant details from tastykhana and Zomato"
task :add_pune_restaurant => :environment do

  require "nokogiri"
  require "open-uri"

@url  = Blorescrapurl.find_all_by_status("p")

@url.each do |u|
   url = u.tkurl
   doc = Nokogiri::HTML(open(url))
mrl = u.zurl
page = Nokogiri::HTML(open(mrl))
rname = page.css('.res-main-name span').text
raddress = page.css('.res-main-address-text').text.split.join(' ')
rcost =  page.css('.cft-big').text.split.join(' ')
rtimings =  page.css('.res-info-timings').text.split.join(' ')
raddress.slice! "India"
u.zurl.slice! "http://www.zomato.com/pune/"
rarea =  u.zurl
rarea = rarea.gsub("-"," ")
doname = rname.downcase
rarea = rarea.gsub("#{doname}", "")
 rcuisine = ""
  rfeatures = ""
somea = page.css('.res-info-cuisines .mr5')
somea.each  do |a|
  if rcuisine == ""
    rcuisine = a.text
  else
  rcuisine = rcuisine + ", " + a.text
end

end

somef = page.css('.res-info-feature-text')
somef.each  do |a|
   if rfeatures == ""
      rfeatures = a.text
    else
    rfeatures = rfeatures + ", " + a.text
  end
end

@restaurant = Restaurant.create(:restname => rname, :rtimings => rtimings, :rcost => rcost, :raddress => raddress, :city => "Bangalore", :delivers => 0 , :rarea => rarea,:rcuisine => rcuisine,:rfeatures => rfeatures)




divs = doc.css('a[id^="main_"]')
divs.each do |d|
     @href = d['href']
 doc.css("#@href div[id^='cat_']").each do |s|
  icategory = s.css('.image h2.tal span').text.split.join(' ')
   s.css('.food_item').each do |r|
   ingredients = r.css('.name .item_desc').text.split.join(' ')
  name = r.css('.name').text.split.join(' ')
  name.slice! "#{ingredients}"
  iname = name
  iprice =  r.css('.money').text.split.join(' ')
   @menuitem = Menuitem.create(:itemname => iname,:itemunitprice => iprice, :itemcategory => icategory, :itemdesc => ingredients, :restaurant_id => @restaurant.id)
  end
end
     
end
u.update_attributes(:status =>"done")

end

end