class Seed
  def self.start
    seed = Seed.new
    # seed.generate_items
    # seed.generate_stores
    seed.generate_roles
    seed.generate_store_admin_and_stores
    seed.generate_categories_with_items
    seed.generate_users
    seed.generate_bids
    seed.generate_pending_bids

    # seed.generate_platform_admin
    seed.generate_orders
  end

  def generate_roles
    roles = %w(user store_admin platform_admin)

    roles.each do |role|
      Role.create!(name: role)
      puts "Role: #{role} was created!"
    end
  end

  def generate_store_admin_and_stores
    image = File.open(Dir.glob(File.join(Rails.root,'lib/assets/', '*')).sample)
    andrew_image = File.open(File.join(Rails.root,'lib/assets/andrew_carmer.jpg'))

    andrew = User.create!(username: "andrew@turing.io",
                          password: "password",
                          first_name: "Andrew",
                          last_name: "Carmer",
                          email_address: "andrew@turing.io",
                          phone_number: "#{Faker::Number.number(3)}-#{Faker::Number.number(3)}-#{Faker::Number.number(4)}",
                          active: true,
                          bio: "Andrew’s extensive business and hospitality experience gives him a unique, pragmatic approach to people and learning. Before joining the Turing team Andrew was - among other, perhaps more traditional, things - a bicycle currier, mud jacker, and artisan pickle maker.",
                          image: andrew_image
                          )
    andrew.roles  << Role.where(name: "store_admin").all.first

    andrew.stores.create!(
            name: Faker::Company.name,
            status: "active"
            )

    puts "Andrew (store admin) and Store: #{andrew.stores.last.name} was created!"

    19.times do |i|
      store_admin = User.create!(
                        username: Faker::Name.name,
                        password: "password#{i}",
                        first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        email_address: Faker::Internet.email,
                        phone_number: Faker::PhoneNumber.phone_number,
                        active: true,
                        bio: Faker::Lorem.paragraph,
                        image: image
                        )
      store_admin.roles << Role.where(name: "store_admin").all.first

      store_admin.stores.create!(
                name: Faker::Company.name,
                status: "active"
        )

      puts "Store Admin #{i}: #{store_admin.username} and Store: #{store_admin.stores.last.name} created!"
    end
  end

  def generate_categories_with_items
    10.times do |i|
      category = Category.create!(
      name: Faker::Commerce.department(1, true)
      )
      add_items(category)
      puts "Category #{i}: #{category.name} created!"
    end
  end

  def generate_users
    josh_image = File.open(File.join(Rails.root,'lib/assets/josh_mejia.jpg'))
    image = File.open(Dir.glob(File.join(Rails.root,'lib/assets/', '*')).sample)

    josh = User.create!(username: "josh@turing.io",
                 password: "password",
                first_name: "Josh",
                last_name: "Mejia",
                email_address: "josh@turing.io",
                phone_number: Faker::PhoneNumber.phone_number,
                active: true,
                bio: "Always looking for the his next challenge, Josh walked away from blue collar jobs to pursue web development in 2007. Working first as a software developer in the energy industry, Josh enjoyed playing a small part in an innovative field that would lead to large, worldwide change.",
                image: josh_image
                )
    josh.roles << Role.first

    99.times do |i|
      user = User.create!(
        username: Faker::Name.name,
        password: "password#{i}",
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email_address: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.phone_number,
        active: true,
        bio: Faker::Lorem.paragraph,
        image: image
        )

        user.roles << Role.first
      puts "User #{i}: #{user.username} - #{user.email_address} created!"
    end
  end

  def generate_bids
    100.times do |i|
      user  = User.find(Random.new.rand(1..50))
      item  = Item.find(Random.new.rand(1..100))
      if item.is_open
        bid_amount = item.current_bid + 5
        bid = BidHistory.create!(user_id: user.id, item_id: item.id, bid_amount: bid_amount)
        puts "Bid #{i}: Order for #{user.username} and #{item.name} created!"
      end
    end
  end

  def generate_pending_bids
    100.times do |i|
      user  = User.find(Random.new.rand(1..50))
      item  = Item.find(Random.new.rand(1..100))
      if item.is_pending
        bid_amount = item.current_bid + 5
        bid = BidHistory.create!(user_id: user.id, item_id: item.id, bid_amount: bid_amount)
        puts "Bid #{i}: Order for #{user.username} and #{item.name} created!"
      end
    end
  end

  def generate_andrew_store_pending_bids
    user = User.where(username: "andrew@turing.io").first
    bidder  = User.find(Random.new.rand(1..50))
    user.store.items.each do |item|
      if item.is_pending
        bid_amount = item.current_bid + 5
        bid = BidHistory.create!(user_id: bidder.id, item_id: item.id, bid_amount: bid_amount)
        puts "Bid #{i}: Order for #{bidder.username} and #{item.name} created!"
      end
    end
  end

  def generate_orders
    Item.closed.each do |item|
      user  = User.find(Random.new.rand(1..50))
      # item  = Item.closed.find(Random.new.rand(1..100))
      if !item.is_open
        bid_amount = item.current_bid + 5
        bid = BidHistory.create!(user_id: user.id, item_id: item.id, bid_amount: bid_amount)
        order = Order.create!(user_id: user.id, item_id: item.id, amount: bid_amount, store_id: item.store.id)
        puts "Bid: Order for #{user.username} and #{item.name} created!"
      end
    end
  end

  # def generate_orders
  #   100.times do |i|
  #     user  = User.find(Random.new.rand(1..50))
  #     order = Order.create!(user_id: user.id)
  #     add_items(order)
  #     puts "Order #{i}: Order for #{user.name} created!"
  #   end
  # end

  private

    def add_items(category)
      50.times do |i|
        item = category.items.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          current_bid: Faker::Number.number(2),
          active: true,
          store_id: Faker::Number.between(1,10),

          auction_length: Faker::Number.between(24, 48),
          image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200")
        puts "Item #{i}: #{item.name} created!"
      end
      10.times do |i|
        item = category.items.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          current_bid: Faker::Number.number(2),
          active: false,
          store_id: Faker::Number.between(1,10),

          auction_length: Faker::Number.between(-40, -10),
          image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200")
        puts "Item #{i}: #{item.name} created!"
      end
      10.times do |i|
        item = category.items.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          current_bid: Faker::Number.number(2),
          active: true,
          store_id: Faker::Number.between(1,10),

          auction_length: Faker::Number.between(-40, -10),
          image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200")
        puts "Item #{i}: #{item.name} created!"
      end
    end
end

Seed.start










# Category.create!([
#   {name: 'Books'},
#   {name: 'Instruments'},
#   {name: 'Video Games'},
#   {name: 'Jewelry'}
#   ])
#
# Store.create!([
#   {name: 'Retro132', status: true},
#   {name: 'WayBACK', status: true},
#   {name: 'Gizmo', status: true},
#   {name: 'AlwayzGotIt', status: true},
#   {name: 'ZeusShop', status: true},
#   {name: 'Nix', status: true},
#   {name: 'TheRetroGuy', status: true},
#   {name: 'Electric', status: true},
#   {name: 'TheMovement', status: true},
#   {name: 'Manafesto', status: true},
#   {name: 'DJI', status: true}
#   ])
#
# Item.create!([
#   {name: 'The Uncanny X-Men #226: February 1988', description: 'Near mint condition, bright colors, no damage; read once then bagged and boxed for 26 years; perfect corners and edges, no water damage or stains.', current_bid: 14, image_url: 'https://img0.etsystatic.com/032/1/9113099/il_570xN.570581454_4bpo.jpg', category_id: 1, store_id: 1, active: true},
#   {name: 'Alpha Flight #29: December 1985', description: 'Near mint condition, bright colors, no damage; read once then bagged and boxed for 29 years; perfect corners and edges, no water damage or stains.', current_bid: 13, image_url: 'https://img0.etsystatic.com/025/1/9113099/il_570xN.577831256_ogmb.jpg', category_id: 1, store_id: 1, active: true},
#   {name: 'Kiso Suzuki Violin Co.1/8 size', description: 'Kiso Suzuki Violin Co. 1/8 size Copy of Antonio Stradivarius 1720. Model No.7. This violin needs to be restored/repaired', current_bid: 120, image_url: 'https://img0.etsystatic.com/070/0/10812039/il_570xN.824322402_kx41.jpg', category_id: 2, store_id: 1, active: true},
#   {name: '1920s Gibson Guitar', description: ' Make: Gibson - Model: L3 - made in 1920 - comes with original hardshell case - has original finish and patfented pick-guard and pick-guard bracket - some scratches and wear due to age - great player and action is still good', current_bid: 240, image_url: 'https://img0.etsystatic.com/060/1/8470789/il_570xN.740865086_5ic4.jpg', category_id: 2, store_id: 1, active: true},
#   {name: 'Beautiful Vintage16 String Wood Lap Harp Instrument Handmade', description: 'Unique Vintage handmade wood harp - 16 strings and made to sit on your lap - It measures approx 20" long from the longest point and 7" wide - I believe it is made of solid oak - No indication of maker', current_bid: 22, image_url: 'https://img1.etsystatic.com/101/0/6477532/il_570xN.847594555_ox1s.jpg', category_id: 2, store_id: 2, active: true},
#   {name: 'Cigar Box Guitar', description: '90 miles - Cigar Box 5 String Acoustic Guitar - Comes with a Protective Case for added safely to the Guitar! 90 miles to Cuba - product of Nicaragua - 20 cigars box - Brass accents hollow inside - acoustic - By Flor De Gonzalez ', current_bid: 195, image_url: 'https://img1.etsystatic.com/111/2/9685328/il_570xN.879231301_edc5.jpg', category_id: 2, store_id: 1, active: true},
#   {name: 'Vintage 1960s Danelectro Convertible Electric Guitar', description: 'This is the real deal, not the re-issue!! I have a working, fully-functional Danelectro Convertible guitar from the early 60s. It sounds incredible plugged in.', current_bid: 500, image_url: 'https://img1.etsystatic.com/139/1/8833728/il_570xN.857472477_nm1x.jpg', category_id: 2, store_id: 1, active: true},
#   {name: 'Night Driver Atari 2600 (1978) Retro Game Atari', description: 'Game: Night Driver - Release Year: 1978 - For Console: Atari 2600 - For Use With: Paddle Controllers (Not included) - Condition: Game Program Cartridge Only. Acceptable+ condition. Surface scratches to label, discoloration on end label. Tested and working.', current_bid: 10, image_url: 'https://img0.etsystatic.com/117/2/11504322/il_570xN.878884832_m0ki.jpg', category_id: 3, store_id: 3, active: true},
#   {name: 'Pac Man Nintendo Game Boy Original (1991) Retro Video Game', description: 'Game: Pac-Man - Release Year: 1991 - For Console: Nintendo Original GameBoy handheld - Condition: Game Pak cartridge only. Good condition. Light normal surface wear. Tested and working.', current_bid: 2, image_url: 'https://img1.etsystatic.com/111/2/11504322/il_570xN.881232101_49cs.jpg', category_id: 3, store_id: 4, active: true},
#   {name: 'Custom Nintendo Nintendo Game Console With 5 Games, Two Controllers And All Necessary Wiring', description: 'Blue nintendo nes system with all necessary wiring and 5 games bases loaded, star Voyager, Black Label Golf, Top Gun, karate champ.All labels are in great condition except bases loaded it does have some scratching on label.', current_bid: 80, image_url: 'https://img1.etsystatic.com/113/0/10682535/il_570xN.880452505_midg.jpg', category_id: 3, store_id: 1, active: true},
#   {name: 'SUPER MARIO 64 Nintendo 64 (N64) Video Game', description: 'Super Mario 64 Game for Nintendo 64 - Manufacturer: Nintendo - Condition: Plays perfect. Colorful label in tact with minimal wear from age, some wear to back sticker. Includes cartridge only.', current_bid: 20, image_url: 'https://img1.etsystatic.com/108/0/6989605/il_570xN.878337215_ci4k.jpg', category_id: 3, store_id: 2, active: true},
#   {name: 'Art Crafts for Amateurs by Fred Miller - 1901', description: 'London, H. Virtue & Co. 1901, 1st edition, hb. Ill.: black-&-white illustrations. Bound in original highly decorated stamped brown and black cloth. 8vo, pp. xii, 248.', current_bid: 200, image_url: 'https://img1.etsystatic.com/030/1/9126157/il_570xN.606093931_xe2b.jpg', category_id: 1, store_id: 5, active: true},
#   {name: 'Frankenstein vintage book by Mary Shelley', description: 'Frankenstein vintage book by Mary Shelley with faux leather binding. Produced in 1973 this is bound in dark blue leatherette with gold detailing.', current_bid: 42, image_url: 'https://img1.etsystatic.com/126/0/6284836/il_570xN.878151651_szsr.jpg', category_id: 1, store_id: 6, active: true},
#   {name: 'Boho Ring with Gemstone', description: 'This Tibetan Carved Silver Ring with an inset gemstone in Slate Grey or Black is the perfect addition to your Boho Chick look!', current_bid: 14, image_url: 'https://img0.etsystatic.com/065/0/8137725/il_570xN.796217752_7uoy.jpg', category_id: 4, store_id: 1, active: true},
#   {name: 'Antique Victorian Jewelry : Mesh Bracelet', description: 'Antique Victorian mesh bracelet with garnets and pearls. An elegant, supple, and weighty piece with a bold and beautiful focal piece.', current_bid: 240, image_url: 'https://img1.etsystatic.com/000/0/6415985/il_570xN.317590315.jpg', category_id: 4, store_id: 7, active: true},
#   {name: 'Vintage Sterling Silver Turquoise pendant necklace', description: 'This is a beautiful large cabochon turquoise stone set in sterling silver with a leaf design wrapping the bottom', current_bid: 74, image_url: 'https://img1.etsystatic.com/072/0/9113541/il_570xN.818530199_f7t6.jpg', category_id: 4, store_id: 7, active: true},
#   {name: 'Antique Ruby Engagement Ring', description: 'A beautiful non-heated ruby Edwardian engagement ring selected from our fine rare collection. The ruby sits between two old mine diamonds.', current_bid: 150, image_url: 'https://img0.etsystatic.com/119/0/8486615/il_570xN.871994516_8tuj.jpg', category_id: 4, store_id: 1, active: true},
#   {name: 'Antique 1880s Victorian Brooch', description: 'This amazing antique Victorian brooch is a real treasure.', current_bid: 250, image_url: 'https://img1.etsystatic.com/047/1/6207455/il_570xN.682023717_enbb.jpg', category_id: 4, store_id: 8, active: true},
#   {name: 'Tula, 100 Bass, Russian Button Bayan, Accordion Instrument', description: 'This is beautiful Russian bayan for any advanced, professional users, for concerts and shows of any kind.', current_bid: 230, image_url: 'https://img1.etsystatic.com/050/0/7049971/il_570xN.723547947_shcz.jpg', category_id: 2, store_id: 9, active: true},
#   {name: 'Mandelin with Zebra stripe back', description: 'Very nice vintage condition. This was a shelf sitter for many, many years.I was told several years ago from an appraiser that it was probably made in Italy.', current_bid: 180, image_url: 'https://img1.etsystatic.com/044/1/7024717/il_570xN.609597239_j4yg.jpg', category_id: 2, store_id: 8, active: true},
#   {name: 'Antique Poetry Books - Instant Collection - Shelley Tennyson Montgomery', description: 'Alfred Tennyson, The Princess, Maud, Locksley Hall, and the Talking Oak; Boston, Houghton, Mifflin and Co., undated (Modern Classics, circa 1882). ', current_bid: 52, image_url: 'https://img0.etsystatic.com/063/1/5829694/il_570xN.789845860_8bv0.jpg', category_id: 1, store_id: 10, active: true},
#   {name: 'Antique Childrens Book - Always Happy - Anecdotes of Felix', description: 'Always Happy, or Anecdotes of Felix and His Sister Serena, by Maria Elizabeth Budden. First published in 1814, this childrens book remained popular throughout the 19th century', current_bid: 18, image_url: 'https://img0.etsystatic.com/124/0/5829694/il_570xN.871874206_b7vb.jpg', category_id: 1, store_id: 1, active: true},
#   {name: 'Sega Genesis Model 1 Console 16 Bit Retro Gaming System', description: 'Console: Sega Genesis - Version: 1st Model, Version 1, Variation 2, Model 1601, FCC ID: FJ8USASEGA - Included: Genesis model 1 console unit, 2 official Sega three-button controllers, Sonic Spinball game cartridge, AC adapter and AV cable.', current_bid: 48, image_url: 'https://img1.etsystatic.com/100/4/11504322/il_570xN.833203249_6kaa.jpg', category_id: 3, store_id: 6, active: true},
#   {name: 'Magnavox Odyssey 2 (1978) Retro Gaming Console', description: 'ncluded: Magnavox Odyssey vintage video game console unit with two hardwired (attached) controllers, Original retail box including styrofoam packing inserts, Owners Manual booklet', current_bid: 118, image_url: 'https://img1.etsystatic.com/102/2/11504322/il_570xN.880460163_born.jpg', category_id: 3, store_id: 11, active: true},
#   {name: 'Sega Genesis Sonic the Hedgehog Original Video Game', description: 'Sonic the Hedgehog for Sega Genesis. This is the "Not for Resale" cartridge and case. This iconic game still works and is in excellent condition!', current_bid: 20, image_url: 'https://img1.etsystatic.com/102/0/6417583/il_570xN.844182525_h323.jpg', category_id: 3, store_id: 6, active: true}
#   ])
#
# User.create!([
#   {username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678', active: true},
#   {username: 'store_admin', password: 'password', first_name: 'Storeman', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678', active: true},
#   {username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024', active: true},
#   {username: 'tylerk', password: 'password', first_name: 'Tyler', last_name: 'Komoroske', email_address: 'tylerk@yahoo.com', phone_number: '203-858-9090', active: true},
#   {username: 'robbielane', password: 'password', first_name: 'Robbie', last_name: 'Lane', email_address: 'robbielane@gamil.com', phone_number: '111-222-3333', active: true}
#   ])
#
# Role.create!([
#   {name: "user"},
#   {name: "store_admin"},
#   {name: "platform_admin"}
#   ])
#
#   UserRole.create!([
#     {user_id: User.where(first_name: "Storeman").first.id, role_id: 2}
#     ])
#
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
