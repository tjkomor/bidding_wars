Category.create!([
  {name: 'Lenses'},
  {name: 'Bodies'},
  {name: 'Accessories'},
  {name: "Drones"}
  ])

Store.create!([
  {name: 'Canon', status: true},
  {name: 'Sony', status: true},
  {name: 'Gitzo', status: true},
  {name: 'Lee', status: true},
  {name: 'Zeiss', status: true},
  {name: 'Nikon', status: true},
  {name: 'SanDisk', status: true},
  {name: 'Elinchrom', status: true},
  {name: 'Impact', status: true},
  {name: 'Manfrotto', status: true},
  {name: 'DJI', status: true}
  ])

Item.create!([
  {name: 'Canon EF 70-200mm f/2.8L', description: 'Two mode optical image stabilization', current_bid: 14, image_url: 'http://www.bhphotovideo.com/images/images1000x1000/Canon_2751B002_EF_70_200mm_f_2_8L_IS_680103.jpg', category_id: 1, store_id: 1, active: true},
  {name: 'Canon EF 16-35mm f/2.8L', description: 'Ultra Wide Angle', current_bid: 13, image_url: 'http://www.bhphotovideo.com/images/images2500x2500/Canon_1910B002AA_EF_16_35mm_f_2_8L_II_486708.jpg', category_id: 1, store_id: 1, active: true},
  {name: 'Canon EF 50mm f/1.2L', description: 'Ultrasonic autofocus motor', current_bid: 12, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_1257B002AA_Normal_EF_50mm_f_1_2L_1446051114000_457680.jpg', category_id: 1, store_id: 1, active: true},
  {name: 'Canon EOS 5D Mark III DSLR', description: '22.3 MP Full-Frame CMOS Sensor', current_bid: 24, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_5260A002_EOS_5D_Mark_III_1446051114000_847545.jpg', category_id: 2, store_id: 1, active: true},
  {name: 'Sony Alpha a7R II Mirrorless', description: '42MP Full-Frame Exmor R BSI CMOS Sensor', current_bid: 22, image_url: 'http://static.bhphoto.com/images/images500x500/sony_a7r_mark_ii_digital_1433958442000_1159878.jpg', category_id: 2, store_id: 2, active: true},
  {name: 'Canon EOS 7D Mark II DSLR', description: '20.2MP APS-C CMOS Sensor', current_bid: 19, image_url: 'http://static.bhphoto.com/images/images500x500/canon_9128b002_eos_7d_mark_ii_1446052042000_1081808.jpg', category_id: 2, store_id: 1, active: true},
  {name: 'Canon Speedlite 600EX-RT', description: 'Compatible with Canon E-TTL / E-TTL II', current_bid: 8, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_5296B002_Speedlite_600EX_1330619741000_847537.jpg', category_id: 3, store_id: 1, active: true},
  {name: 'Gitzo GT1542T Carbon Fiber Tripod', description: '17.6 lb Load Capacity', current_bid: 10, image_url: 'http://static.bhphoto.com/images/images500x500/Gitzo_GT1542T_Series_1_Traveler_6x_1300897009000_759477.jpg', category_id: 3, store_id: 3, active: true},
  {name: 'LEE Filters 100 x 100mm Big Stopper', description: 'Increase exposure length, helps to convey movement', current_bid: 2, image_url: 'http://static.bhphoto.com/images/multiple_images/images500x500/1409837414000_IMG_420938.jpg', category_id: 3, store_id: 4, active: true},
  {name: 'Canon EOS Rebel T5 DSLR', description: '18 MP APS-C CMOS Sensor', current_bid: 14, image_url: 'http://static.bhphoto.com/images/images500x500/canon_9126b003_eos_a_rebel_t5_dslr_1392227429000_1030209.jpg', category_id: 2, store_id: 1, active: true},
  {name: 'Sony FE 70-200mm f/4.0', description: 'Optical SteadyShot Image Stabilization', current_bid: 14, image_url: 'http://www.bhphotovideo.com/images/images1000x1000/sony_sel70200g_70_200mm_f_4_5_6_g_lens_1029862.jpg', category_id: 1, store_id: 2, active: true},
  {name: 'Zeiss Loxia 35mm f/2', description: 'Biogon Optical Design', current_bid: 16, image_url: 'http://static.bhphoto.com/images/images500x500/zeiss_2103_749_loxia_35mm_f_2_biogon_1410188713000_1080388.jpg', category_id: 1, store_id: 5, active: true},
  {name: 'Nikon D4S DSLR Camera', description: '16.2MP FX-Format CMOS Sensor, EXPEED 4 Image Processor, Full HD 1080p Video Recording at 60 fps', current_bid: 42, image_url: 'http://static.bhphoto.com/images/images500x500/nikon_d4s_digital_slr_camera_1393338990000_1024081.jpg', category_id: 2, store_id: 6, active: true},
  {name: 'Canon EOS 5DS R DSLR Camera', description: '50.6 MP Full-Frame CMOS Sensor, Dual DIGIC 6 Image Processors, Low-Pass Filter Effect Cancellation', current_bid: 36, image_url: 'http://static.bhphoto.com/images/images500x500/canon_0582c002_eos_5ds_r_dslr_1446052042000_1119027.jpg', category_id: 2, store_id: 1, active: true},
  {name: 'SanDisk 32GB Extreme Pro UHS-I SDHC U3 Memory Card', description: '32GB Data Storage Capacity, Class 10 Speed, Ultra High Speed Class 3', current_bid: 2, image_url: 'http://static.bhphoto.com/images/images500x500/SanDisk_SDSDXPA_032G_A75_Extreme_Pro_32_GB_1418848588000_824140.jpg', category_id: 3, store_id: 7, active: true},
  {name: 'SanDisk 64GB Extreme Pro CompactFlash Memory Card', description: '64GB Storage Capacity, Optimized for 4K Video Recording, Up to 160MB/s Read Speed', current_bid: 6, image_url: 'http://static.bhphoto.com/images/images500x500/sandisk_sdcfxps_064g_a46_64gb_extreme_pro_compact_1414593946000_1000363.jpg', category_id: 3, store_id: 7, active: true},
  {name: 'Canon EF 800mm f/5.6L IS USM Lens', description: 'EF Mount L-Series Lens, Aperture Range: f/5.6-32, Fluorite, UD, Super UD Lens Elements', current_bid: 150, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_2746B002AA_EF_800mm_f_5_6L_IS_1280512824000_542293.jpg', category_id: 1, store_id: 1, active: true},
  {name: 'Elinchrom D-Lite 400W/s RX 4 Flash Head', description: 'Built-in Skyport Wireless Receiver, Multi-voltage Monolight: 90-260VAC, Recycling: 0.35-1.6 Sec. (115V)', current_bid: 18, image_url: 'http://static.bhphoto.com/images/images500x500/elinchrom_el_20487_1_d_lite_rx_4_400ws_1356101225000_906646.jpg', category_id: 3, store_id: 8, active: true},
  {name: 'Impact LB-QL300 Luxbanx Duo Softbox (16 x 22")', description: 'Silver Interior, Heat Resistant up to 300W', current_bid: 8, image_url: 'http://static.bhphoto.com/images/images500x500/impact_lb_ql300_luxbanx_duo_softbox_1395081345000_890529.jpg', category_id: 3, store_id: 9, active: true},
  {name: 'Elinchrom EL-Skyport Transceiver RX', description: 'For RX Series ONLY', current_bid: 6, image_url: 'http://static.bhphoto.com/images/images500x500/Elinchrom_EL_19350_Skyport_SPEED_Transmitter_1274882421000_696329.jpg', category_id: 3, store_id: 8, active: true},
  {name: 'Manfrotto 680B Compact Monopod', description: 'Aluminum Construction, 4 Sections, Optional Ball, Pan/Tilt, Fluid Heads, Maximum Height: 60.63"', current_bid: 8, image_url: 'http://static.bhphoto.com/images/images500x500/Manfrotto_680B_680B_Compact_Monopod_Black_1267720369000_5535.jpg', category_id: 3, store_id: 10, active: true},
  {name: 'Canon Timer Remote Controller TC-80N3', description: 'Remote Shutter Release, Functions as an Intervalometer, Self-Timer, Interval Timer', current_bid: 4, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_2477A002_Timer_Remote_Controller_TC_80N3_1328215960000_164271.jpg', category_id: 3, store_id: 1, active: true},
  {name: 'Nikon MC-36A Multi-Function Remote Cord', description: 'Remote Shutter Release, Functions as Timer Remote', current_bid: 4, image_url: 'http://static.bhphoto.com/images/images500x500/Nikon_27032_MC_36_Multi_Function_Remote_Cord_1351115244000_892745.jpg', category_id: 3, store_id: 6, active: true},
  {name: 'DJI Phantom 3 Professional Quadcopter', description: 'Gimbal Stabilized 4K Camera, Camera Takes 12MP Still Photos, 720p HD App-Based Monitoring', current_bid: 40, image_url: 'http://static.bhphoto.com/images/images500x500/dji_phantom_3_professional_quadcopter_1428511277000_1133098.jpg', category_id: 4, store_id: 11, active: true},
  {name: 'Nikon AF-S NIKKOR 14-24mm f/2.8G ED Lens', description: 'F Mount Lens/FX Format, Aperture Range: f/2.8 to 22, Two ED Glass & Three Aspherical Elements, Nano Crystal & Super Integrated Coating', current_bid: 20, image_url: 'http://static.bhphoto.com/images/images500x500/Nikon_2163_AF_S_Zoom_Nikkor_14_24mm_1276697904000_520635.jpg', category_id: 1, store_id: 6, active: true}
  ])

User.create!([
  {username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678', role: 1, active: true},
  {username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024', role: 0, active: true},
  {username: 'tylerk', password: 'password', first_name: 'Tyler', last_name: 'Komoroske', email_address: 'tylerk@yahoo.com', phone_number: '203-858-9090', role: 0, active: true},
  {username: 'robbielane', password: 'password', first_name: 'Robbie', last_name: 'Lane', email_address: 'robbielane@gamil.com', phone_number: '111-222-3333', role: 0, active: true}
  ])

# Address.create!([
#   {line_one: '1510 Blake Street', line_two: nil, city: 'Denver', state: 'CO', zip: '80202', country: 'USA', user_id: 1},
#   {line_one: '1234 Oak Street', line_two: 'Apartment 27', city: 'Denver', state: 'CO', zip: '80202', country: 'USA', user_id: 2},
#   {line_one: '1000 Elm Street', line_two: nil, city: 'Portlans', state: 'OR', zip: '97212', country: 'USA', user_id: 3},
#   {line_one: '1914 17th Street', line_two: 'Apartment 412', city: 'Denver', state: 'CO', zip: '80202', country: 'USA', user_id: 4}
#   ])
#
# Rental.create!([
#   {user_id: 2, days_rented: 5, total_price: 310, status: 'Completed'},
#   {user_id: 2, days_rented: 3, total_price: 150, status: 'Completed'},
#   {user_id: 3, days_rented: 3, total_price: 186, status: 'Paid'},
#   {user_id: 4, days_rented: 3, total_price: 192, status: 'Cancelled'},
#   {user_id: 2, days_rented: 4, total_price: 200, status: 'Out'},
#   {user_id: 2, days_rented: 3, total_price: 174, status: 'Paid'}
#   ])
#
# RentalItem.create!([
#   {rental_id: 1, item_id: 3, quantity: 1},
#   {rental_id: 1, item_id: 2, quantity: 2},
#   {rental_id: 1, item_id: 4, quantity: 1},
#   {rental_id: 2, item_id: 1, quantity: 1},
#   {rental_id: 2, item_id: 5, quantity: 1},
#   {rental_id: 2, item_id: 10, quantity: 1},
#   {rental_id: 3, item_id: 9, quantity: 1},
#   {rental_id: 3, item_id: 7, quantity: 2},
#   {rental_id: 3, item_id: 15, quantity: 1},
#   {rental_id: 3, item_id: 13, quantity: 1},
#   {rental_id: 4, item_id: 1, quantity: 3},
#   {rental_id: 4, item_id: 8, quantity: 1},
#   {rental_id: 4, item_id: 3, quantity: 1},
#   {rental_id: 5, item_id: 7, quantity: 3},
#   {rental_id: 5, item_id: 4, quantity: 1},
#   {rental_id: 5, item_id: 9, quantity: 1},
#   {rental_id: 6, item_id: 14, quantity: 3},
#   {rental_id: 6, item_id: 5, quantity: 1}
#   ])
