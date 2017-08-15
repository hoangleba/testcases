path="`dirname \"$0\"`"
source "$path/config.sh"

# Geo Location
long_ip=0
for (( i=0 ; i<4 ; ++i )); do
	((long_ip+=${IP%%.*}*$((256**$((3-${i}))))))
	IP=${IP#*.}
done
result=$(redis-cli -h $GEO_HOST -p $GEO_PORT DEL geo_${long_ip})
result=$(redis-cli -h $GEO_HOST -p $GEO_PORT SET geo_${long_ip} '{"country":"VN","city":"Ho Chi Minh","carrier":"MobiFone"}')
result=$(redis-cli -h $GEO_HOST -p $GEO_PORT GET geo_${long_ip})


# Placement
result=$(redis-cli -h $PLACEMENTS_HOST -p $PLACEMENTS_PORT DEL pl_dfe43c4e968848d3b61cc0df214c2d70)
result=$(redis-cli -h $PLACEMENTS_HOST -p $PLACEMENTS_PORT HMSET pl_dfe43c4e968848d3b61cc0df214c2d70 zone_id '74bfe71425ce46048c05a088b5260607' height '1' width '1' type 'mobile' website_id 'ad85c58281be4b9682a42a5c9b7dd219' advertisements '["cd93ac6cb74c447bbe05351dcdf6de6b"]' placement_settings '{"min_width":"1","min_height":"1","max_width":"1","max_height":"1","template":"<article data-track=\"|index1\" data-aid=\"21767134\" class=\"item \">\n    <a onclick=\"[yo_fn_click]\" href=\"javascript:void(0)\">\n        <figure>\n            <img data-src=\"[yo_mthumbnail]\" src=\"[yo_mthumbnail]\" alt=\"[yo_title]\" width=\"278\" height=\"174\">\n            <noscript>\n                &amp;lt;img src=\"[yo_mthumbnail]\"&amp;gt;\n            <\/noscript>\n        <\/figure>\n        <header>\n            <h2>[yo_title]<\/h2>\n            <p class=\"meta\">\n                <span>Zing<\/span>\n                <time class=\"friendly\" datetime=\"2017-03-15T08:16:00+07:00\">2 gi\u1edd<\/time>\n                <i class=\"spr video-icon\"><\/i>\n            <\/p>\n\n        <\/header>\n    <\/a>\n    <p class=\"tools\">\n        <a href=\"#\" class=\"like\">\n            <i class=\"spr spr-like\"><\/i>\n            <span>0<\/span>\n        <\/a>\n    <\/p>\n<\/article>","position":{"insert":"random","name":"DIV_NATIVE_AD","type":"id"}}')

# Website
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL w_ad85c58281be4b9682a42a5c9b7dd219)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET w_ad85c58281be4b9682a42a5c9b7dd219 domain 'demo.yomedia.vn' market 'vn' categories '["2db35960b8f748309f0fa073a9eb31a4","749154f0731549709ecbca9ed44bcd47","7bcc05c9039a455c8afc9081d659d355","a2de623aeb3f4eaabcacb16ae113b079","acb77bcf6e3644e984417314300e53e2","d0fefe31e6dc4bb081c2987be70404c6","d14e13ef1aa64e8fb0cb5494a3171c64","d15a7999b63d426cb404af3f760edcff","e2c01e720a0243c3918ab7f8a69d4cbc","e3784d8d8e154d2380e2daaabb4206da"]')

# Category
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_2db35960b8f748309f0fa073a9eb31a4)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_2db35960b8f748309f0fa073a9eb31a4 category_name 'Books & Literature' iab 'IAB1-1')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_749154f0731549709ecbca9ed44bcd47)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_749154f0731549709ecbca9ed44bcd47 category_name "Women's Health" iab 'IAB8-47' trackid '2016090700000000011')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_7bcc05c9039a455c8afc9081d659d355)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_7bcc05c9039a455c8afc9081d659d355 category_name 'College Administration' iab 'IAB5-4')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_a2de623aeb3f4eaabcacb16ae113b079)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_a2de623aeb3f4eaabcacb16ae113b079 category_name 'American Cuisine' iab 'IAB7-1')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_acb77bcf6e3644e984417314300e53e2)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_acb77bcf6e3644e984417314300e53e2 category_name 'C/C++' iab 'IAB22-4')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_d0fefe31e6dc4bb081c2987be70404c6)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_d0fefe31e6dc4bb081c2987be70404c6 category_name 'Movies' iab 'IAB1-5')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_d14e13ef1aa64e8fb0cb5494a3171c64)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_d14e13ef1aa64e8fb0cb5494a3171c64 category_name 'Marketing' iab 'IAB3-11')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_d15a7999b63d426cb404af3f760edcff)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_d14e13ef1aa64e8fb0cb5494a3171c64 category_name 'International News' iab 'IAB12-1' trackid '2016070110000000012')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_e2c01e720a0243c3918ab7f8a69d4cbc)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_e2c01e720a0243c3918ab7f8a69d4cbc category_name 'Football' iab 'IAB20-12')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_e3784d8d8e154d2380e2daaabb4206da)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_e3784d8d8e154d2380e2daaabb4206da category_name 'Family Internet' iab 'IAB6-4' trackid '2016070110000000006')

result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL cat_51b6bb2730b74b7cb7f15c1bdaf075b4)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET cat_51b6bb2730b74b7cb7f15c1bdaf075b4 category_name 'News' iab 'IAB12' trackid '2016070110000000012')

# Advertisement
result=$(redis-cli -h $ADVERTISEMENTS_HOST -p $ADVERTISEMENTS_PORT DEL ad_cd93ac6cb74c447bbe05351dcdf6de6b)
result=$(redis-cli -h $ADVERTISEMENTS_HOST -p $ADVERTISEMENTS_PORT HMSET ad_cd93ac6cb74c447bbe05351dcdf6de6b flight_id '4de6dda776cb420aa2fcaac3e0f053fc' cost_received '0.000000' cost_paid '1.000000')

# Flight
result=$(redis-cli -h $FLIGHTS_HOST -p $FLIGHTS_PORT DEL fl_4de6dda776cb420aa2fcaac3e0f053fc)
result=$(redis-cli -h $FLIGHTS_HOST -p $FLIGHTS_PORT HMSET fl_4de6dda776cb420aa2fcaac3e0f053fc flight_name 'Infeed Native Ad Mobile Testing' buy_type 'cpm' added_value '0.00' bookings_type 'impression' daily_bookings '1' campaign_id '7eb3e2fc77e04bc984eb548eba50b817' banner_id 'eb9975b6e6c64e8896b57ab9998e3f4f' delivery_id 'eebe98f29524431faf52d43732426ec3' category_id '51b6bb2730b74b7cb7f15c1bdaf075b4' product_id '77f5c394455141bb9f83c434231492c1' bookings '1000.00')

# Campaign
result=$(redis-cli -h $CAMPAIGNS_HOST -p $CAMPAIGNS_PORT DEL c_7eb3e2fc77e04bc984eb548eba50b817)
result=$(redis-cli -h $CAMPAIGNS_HOST -p $CAMPAIGNS_PORT HMSET c_7eb3e2fc77e04bc984eb548eba50b817 timezone 'Asia/Ho_Chi_Minh' currency 'VND' conversion '["72d780341e3345608c4ca8cc1e7294d8"]')

# Banner
result=$(redis-cli -h $BANNERS_HOST -p $BANNERS_PORT DEL b_eb9975b6e6c64e8896b57ab9998e3f4f)
result=$(redis-cli -h $BANNERS_HOST -p $BANNERS_PORT HMSET b_eb9975b6e6c64e8896b57ab9998e3f4f creative_source '{"title":"Pro Theatre Series - Ho\u00e0n M\u1ef9 Trong T\u1eebng \u0110\u01b0\u1eddng N\u00e9t","short_intro":"Pro Theatre Series - Ho\u00e0n M\u1ef9 Trong T\u1eebng \u0110\u01b0\u1eddng N\u00e9t","content":"Pro Theatre Series - Ho\u00e0n M\u1ef9 Trong T\u1eebng \u0110\u01b0\u1eddng N\u00e9t","small_thumbnail":"http:\/\/media_obj.9730a73b.cdnviet.com\/2017\/banner-testing\/native-in-feed\/images\/hinh.jpg","medium_thumbnail":"http:\/\/media_obj.9730a73b.cdnviet.com\/2017\/banner-testing\/native-in-feed\/images\/hinh.jpg","large_thumbnail":"http:\/\/media_obj.9730a73b.cdnviet.com\/2017\/banner-testing\/native-in-feed\/images\/hinh.jpg"}' ad_format '6694947b6b5a4abc9255005bcc813f69' banner_type 'template' template_name 'mobile_in_feed_native' landing_page 'http://yomedia.vn')

# Ad Format
result=$(redis-cli -h $ADFORMATS_HOST -p $ADFORMATS_PORT DEL adf_6694947b6b5a4abc9255005bcc813f69)
result=$(redis-cli -h $ADFORMATS_HOST -p $ADFORMATS_PORT HMSET adf_6694947b6b5a4abc9255005bcc813f69 format_name 'Mobile In-feed Native (VN)')

# Delivery
result=$(redis-cli -h $DELIVERIES_HOST -p $DELIVERIES_PORT DEL dl_eebe98f29524431faf52d43732426ec3)
result=$(redis-cli -h $DELIVERIES_HOST -p $DELIVERIES_PORT HMSET dl_eebe98f29524431faf52d43732426ec3 date_range '[{"from":"2016-08-05","to":"2017-08-05"},{"from":"2017-08-06","to":"2018-09-13"}]' geo_country '["vn"]')

# Conversion
result=$(redis-cli -h $CONVERSIONS_HOST -p $CONVERSIONS_PORT DEL conv_72d780341e3345608c4ca8cc1e7294d8)
result=$(redis-cli -h $CONVERSIONS_HOST -p $CONVERSIONS_PORT HMSET conv_72d780341e3345608c4ca8cc1e7294d8 post_type 'all' tracking_variables '["fullname","email","address","birthday"]' conversion_expired '6')