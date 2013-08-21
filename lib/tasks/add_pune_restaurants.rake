desc "Get the Restaurant details from tastykhana"
task :add_pune_restaurant => :environment do

  require "nokogiri"
  require "open-uri"

@url  = Punescrapurl.find_all_by_status("p")

@url.each do |u|
   url = u.tkurl
   doc = Nokogiri::HTML(open(url))
   rname = doc.css('.current .small').text
   rtimings = doc.css('.open').text
   rminorder = doc.css('#info_box li:nth-child(2) .money').text.split.join(' ')
   rcost = doc.css('#info_box li:nth-child(3) .money').text.split.join(' ')
mrl = u.zurl
page = Nokogiri::HTML(open(mrl))
raddress = page.css('.res-main-address-text').text.split.join(' ')
raddress.slice! "India"
u.zurl.slice! "http://www.zomato.com/pune/"
rarea =  u.zurl
rarea = rarea.gsub("-"," ")
doname = rname.downcase
rarea = rarea.gsub("#{doname}", "")

@restaurant = Restaurant.create(:restname => rname, :rtimings => rtimings, :restdelmin => rminorder, :rcost => rcost, :raddress => raddress, :city => "Pune", :delivers => "false", :rarea => rarea)


   doc.css('#menu_parts').each do |r|
     r.css('.food_item').each do |f|
       ingredients = f.css('.name .ingredients').text
    iname = f.css('.name').text
     iname.slice! "#{ingredients}"
    iprice = f.css('.price .money').text
    icategory = r.css('.scroll_tab .name').text.split.join(' ')
    @menuitem = @restaurant.menuitems.create(:itemname => iname,:itemunitprice => iprice, :itemcategory => icategory)
  end
  
end
u.update_attributes(:status =>"done")

end

end