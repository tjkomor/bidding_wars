Category.create!([
  {name: 'Lenses'},
  {name: 'Bodies'},
  {name: 'Accessories'}
  ])

Brand.create!([
  {name: 'Canon'},
  {name: 'Sony'},
  {name: 'Gitzo'},
  {name: 'Lee'}
  ])

Item.create!([
  {name: 'Canon EF 70-200mm f/2.8L', description: 'Two mode optical image stabilization', price: 14, image_url: 'http://www.bhphotovideo.com/images/images1000x1000/Canon_2751B002_EF_70_200mm_f_2_8L_IS_680103.jpg', category_id: 1, brand_id: 1},
  {name: 'Canon EF 16-35mm f/2.8L', description: 'Ultra Wide Angle', price: 13, image_url: 'http://www.bhphotovideo.com/images/images2500x2500/Canon_1910B002AA_EF_16_35mm_f_2_8L_II_486708.jpg', category_id: 1, brand_id: 1},
  {name: 'Canon EF 50mm f/1.2L', description: 'Ultrasonic autofocus motor', price: 12, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_1257B002AA_Normal_EF_50mm_f_1_2L_1446051114000_457680.jpg', category_id: 1, brand_id: 1},
  {name: 'Canon EOS 5D Mark III DSLR', description: '22.3 MP Full-Frame CMOS Sensor', price: 24, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_5260A002_EOS_5D_Mark_III_1446051114000_847545.jpg', category_id: 2, brand_id: 1},
  {name: 'Sony Alpha a7R II Mirrorless', description: '42MP Full-Frame Exmor R BSI CMOS Sensor', price: 22, image_url: 'http://static.bhphoto.com/images/images500x500/sony_a7r_mark_ii_digital_1433958442000_1159878.jpg', category_id: 2, brand_id: 2},
  {name: 'Canon EOS 7D Mark II DSLR', description: '20.2MP APS-C CMOS Sensor', price: 19, image_url: 'http://static.bhphoto.com/images/images500x500/canon_9128b002_eos_7d_mark_ii_1446052042000_1081808.jpg', category_id: 2, brand_id: 1},
  {name: 'Canon Speedlite 600EX-RT', description: 'Compatible with Canon E-TTL / E-TTL II', price: 8, image_url: 'http://static.bhphoto.com/images/images500x500/Canon_5296B002_Speedlite_600EX_1330619741000_847537.jpg', category_id: 3, brand_id: 1},
  {name: 'Gitzo GT1542T Carbon Fiber Tripod', description: '17.6 lb Load Capacity', price: 10, image_url: 'http://static.bhphoto.com/images/images500x500/Gitzo_GT1542T_Series_1_Traveler_6x_1300897009000_759477.jpg', category_id: 3, brand_id: 3},
  {name: 'LEE Filters 100 x 100mm Big Stopper', description: 'Increase exposure length, helps to convey movement', price: 2, image_url: 'http://static.bhphoto.com/images/multiple_images/images500x500/1409837414000_IMG_420938.jpg', category_id: 3, brand_id: 4}
  ])

User.create!([
  {username: 'admin', password: 'admin'},
  {username: 'rossedfort', password: 'password'}
  ])

Rental.create!([
  {user_id: 2, days_rented: 5, total_price: 78},
  {user_id: 2, days_rented: 3, total_price: 79}
  ])

RentalItem.create!([
  {rental_id: 1, item_id: 3, quantity: 1},
  {rental_id: 1, item_id: 2, quantity: 2},
  {rental_id: 2, item_id: 1, quantity: 1},
  {rental_id: 2, item_id: 5, quantity: 1}
  ])
