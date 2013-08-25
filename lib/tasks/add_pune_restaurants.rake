desc "Get the Restaurant details from tastykhana"
task :add_pune_restaurant => :environment do

  require "nokogiri"
  require "open-uri"

@url  = Punescrapurl.find_all_by_status("p")

@url.each do |u|
   url = u.tkurl
   doc = Nokogiri::HTML(open(url))
   rtimings = doc.css('.open').text
   rminorder = doc.css('#info_box li:nth-child(2) .money').text.split.join(' ')
   rcost = doc.css('#info_box li:nth-child(3) .money').text.split.join(' ')
mrl = u.zurl
page = Nokogiri::HTML(open(mrl))
rname = page.css('.res-main-name span').text
raddress = page.css('.res-main-address-text').text.split.join(' ')
raddress.slice! "India"
u.zurl.slice! "http://www.zomato.com/pune/"
rarea =  u.zurl
rarea = rarea.gsub("-"," ")
doname = rname.downcase
rarea = rarea.gsub("#{doname}", "")

@restaurant = Restaurant.create(:restname => rname, :rtimings => rtimings, :restdelmin => rminorder, :rcost => rcost, :raddress => raddress, :city => "Pune", :delivers => "false", :rarea => rarea)

divs = doc.css('a[id^="main_"]')
divs.each do |d|
  icategory = d.text.split.join(' ')
      @href = d['href']
  doc.css("#@href .food_item").each do |r|
    ingredients = r.css('.name .item_desc').text.split.join(' ')
   name = r.css('.name').text
   name.slice! "#{ingredients}"
   iname = name.split.join(' ')
   iprice = r.css('.money').text.split.join(' ')
 
  /#
     r.css('.food_item').each do |f|
       ingredients = f.css('.name .ingredients').text
    iname = f.css('.name').text
     iname.slice! "#{ingredients}"
    iprice = f.css('.price').text
    icategory = r.css('.scroll_tab .name').text.split.join(' ')
    #/
    
    @menuitem = @restaurant.menuitems.create(:itemname => iname,:itemunitprice => iprice, :itemcategory => icategory, :itemdesc => ingredients)
  end
  
end
u.update_attributes(:status =>"done")

end

end