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
result=$(redis-cli -h $PLACEMENTS_HOST -p $PLACEMENTS_PORT DEL pl_0681c381c8364325a1a242bd9340eebf)
result=$(redis-cli -h $PLACEMENTS_HOST -p $PLACEMENTS_PORT HMSET pl_0681c381c8364325a1a242bd9340eebf zone_id 'dba74dc8bb6d42c4a17147b6b3777e22' height '1' width '1' type 'video' website_id 'ad85c58281be4b9682a42a5c9b7dd219' advertisements '["1fbe6ba7320c451e8aa010e5be201878","4ec67dfba66a4385b3ed96284186ec22","dac6a81fc42242d893e4e9d0532e4de7","fbec7e598a734c9b901f6261e4f3ac5f"]' placement_settings '{"video_ad_format":"preroll","config":"vast","show_skip":"1","show_after":"7","ad_duration":"30"}')

# Website
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT DEL w_ad85c58281be4b9682a42a5c9b7dd219)
result=$(redis-cli -h $CATEGORIES_HOST -p $CATEGORIES_PORT HMSET w_ad85c58281be4b9682a42a5c9b7dd219 domain 'demo.yomedia.vn' market 'vn' categories '["2db35960b8f748309f0fa073a9eb31a4","749154f0731549709ecbca9ed44bcd47","7bcc05c9039a455c8afc9081d659d355","a2de623aeb3f4eaabcacb16ae113b079","acb77bcf6e3644e984417314300e53e2","d0fefe31e6dc4bb081c2987be70404c6","d14e13ef1aa64e8fb0cb5494a3171c64","d15a7999b63d426cb404af3f760edcff","e2c01e720a0243c3918ab7f8a69d4cbc","e3784d8d8e154d2380e2daaabb4206da"]' verify '1')

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
result=$(redis-cli -h $ADVERTISEMENTS_HOST -p $ADVERTISEMENTS_PORT DEL ad_1fbe6ba7320c451e8aa010e5be201878)
result=$(redis-cli -h $ADVERTISEMENTS_HOST -p $ADVERTISEMENTS_PORT HMSET ad_1fbe6ba7320c451e8aa010e5be201878 flight_id 'e1ffb7ca9dbc4f529a2b2c45170bf2a1' cost_received '0.000000' cost_paid '1.000000')

# Flight
result=$(redis-cli -h $FLIGHTS_HOST -p $FLIGHTS_PORT DEL fl_e1ffb7ca9dbc4f529a2b2c45170bf2a1)
result=$(redis-cli -h $FLIGHTS_HOST -p $FLIGHTS_PORT HMSET fl_e1ffb7ca9dbc4f529a2b2c45170bf2a1 flight_name 'Preroll Inline 15s Testing' buy_type 'cpm' added_value '0.00' bookings_type 'impression' daily_bookings '1' campaign_id '7eb3e2fc77e04bc984eb548eba50b817' banner_id '1f485d37968d4e8fb2e1f1c1fe5f49b2' delivery_id 'eebe98f29524431faf52d43732426ec3' category_id '51b6bb2730b74b7cb7f15c1bdaf075b4' product_id '47eb13ff3ed442c6af21579c5b4429ae' bookings '1000.00')

# Campaign
result=$(redis-cli -h $CAMPAIGNS_HOST -p $CAMPAIGNS_PORT DEL c_7eb3e2fc77e04bc984eb548eba50b817)
result=$(redis-cli -h $CAMPAIGNS_HOST -p $CAMPAIGNS_PORT HMSET c_7eb3e2fc77e04bc984eb548eba50b817 timezone 'Asia/Ho_Chi_Minh' currency 'VND' conversion '["72d780341e3345608c4ca8cc1e7294d8"]')

# Banner
result=$(redis-cli -h $BANNERS_HOST -p $BANNERS_PORT DEL b_1f485d37968d4e8fb2e1f1c1fe5f49b2)
result=$(redis-cli -h $BANNERS_HOST -p $BANNERS_PORT HMSET b_1f485d37968d4e8fb2e1f1c1fe5f49b2 creative_source '{"source":"2017\/06\/spec\/preroll-mobile\/tvc.mp4","skip_ad":"7","duration":"15"}' ad_format '0ec07dd2dc7648538509f1f6a69bf230' banner_type 'template' template_name 'video_preroll_15s_inline' landing_page 'http://yomedia.vn')

# Ad Format
result=$(redis-cli -h $ADFORMATS_HOST -p $ADFORMATS_PORT DEL adf_0ec07dd2dc7648538509f1f6a69bf230)
result=$(redis-cli -h $ADFORMATS_HOST -p $ADFORMATS_PORT HMSET adf_0ec07dd2dc7648538509f1f6a69bf230 format_name 'Video Pre-roll 15s (Inline) (VN)')

# Delivery
result=$(redis-cli -h $DELIVERIES_HOST -p $DELIVERIES_PORT DEL dl_eebe98f29524431faf52d43732426ec3)
#result=$(redis-cli -h $DELIVERIES_HOST -p $DELIVERIES_PORT HMSET dl_eebe98f29524431faf52d43732426ec3 date_range '[{"from":"2016-08-05","to":"2017-08-05"},{"from":"2017-08-06","to":"2018-09-13"}]' geo_country '["vn"]')

# Conversion
result=$(redis-cli -h $CONVERSIONS_HOST -p $CONVERSIONS_PORT DEL conv_72d780341e3345608c4ca8cc1e7294d8)
result=$(redis-cli -h $CONVERSIONS_HOST -p $CONVERSIONS_PORT HMSET conv_72d780341e3345608c4ca8cc1e7294d8 post_type 'all' tracking_variables '["fullname","email","address","birthday"]' conversion_expired '6')