CREATE DATABASE sale
go 
use sale

-- SELECT * FROM Account
-- select * from ITEM
CREATE TABLE [Admin](
    PhoneNumber VARCHAR(11) PRIMARY key,
    Pass NVARCHAR(20) not null
)
GO
CREATE TABLE Account(
    ID INT PRIMARY KEY IDENTITY (1,1),
    PhoneNumber VARCHAR(11) UNIQUE NOT NULL ,
    [Name] NVARCHAR(30) not null,
    Pass NVARCHAR(20) not null,
    Addr NVARCHAR(50) not null
)
GO
CREATE TABLE Item (
	ID INT PRIMARY KEY IDENTITY(1,1),
    Nameitem varchar(30) NOT NULL,
    Genre varchar(50) ,
    Introduction varchar(5000),
    Price REAL NOT NULL,
    Amountleft int not null,
    Picm varchar(500) not null,
    Pict varchar(500) not null,
    Picb varchar(500) not null,
    Pic1 varchar(500),
    Pic2 varchar(500),
    Pic3 varchar(500),
    Pic4 varchar(500),
    Pic5 varchar(500)
)
GO
CREATE TABLE Pay (
    IDPay varchar(20) PRIMARY key,
	IDCus INT FOREIGN key REFERENCES Account(ID),
    Datepay DATETIME DEFAULT GETDATE() not null,
	Addr NVARCHAR(50) NOT NULL,
    Phone VARCHAR(11) NOT NULL,
    Totalpay REAL not null,
	[Status] tinyint default(0),
    Takenote NVARCHAR(200)
)
GO
CREATE TABLE DetailPay(
    IDPay varchar(20) FOREIGN key REFERENCES Pay(idpay),
    IDItem int FOREIGN key REFERENCES Item(ID),
	Amount INT,
	Price REAL,
)
GO
INSERT INTO [dbo].[Admin]
([PhoneNumber],[Pass])
VALUES
('123','1')

GO
INSERT INTO [dbo].[Account]
([phonenumber],[name], [addr], [pass])
VALUES
('0112233445','Duc', 'HN', '1'),
('0221133554','Minh', 'HN', '1'),
('0343434324','Nhu', 'HN','1'),
('1001', 'Laura Anker','32 Dang Thai Mai, Tay Ho, Ha Noi', '1'),
('1002', 'Tim Cork','54 Hong Mai, Hai Ba Trung, Ha Noi', '1'),
('1003', 'Zoe johnal','142 Nguyen Trai, Quan 3, Ho Chi Minh', '1')
GO

INSERT INTO [dbo].[Item]
([nameitem],[genre],[introduction],[price],[amountleft],[picm],[pict],[picb],[pic1],[pic2],[pic3],[pic4],[pic5])
VALUES
('Hogwarts Legacy','1 player, Action',
'Hogwarts Legacy is an immersive, open-world action RPG set in the world first introduced in the Harry Potter books. 

Embark on a journey through familiar and new locations as you explore and discover magical beasts, customise your character and craft potions, master spell casting, upgrade talents and become the wizard you want to be.

Experience Hogwarts in the 1800s. Your character is a student who holds the key to an ancient secret that threatens to tear the wizarding world apart. Discover the feeling of living at Hogwarts as you make allies, battle Dark Wizards and ultimately decide the fate of the wizarding world. ',
45.95,32,
'https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-packshot-thumb-01-en-12jan21.jpg?$1200px$',
'https://i.pinimg.com/originals/88/e4/41/88e4413b4bba4635e1168c4b62f44c1c.png',
'https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-screen-02-ps5-en-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-screen-01-ps5-en-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-screen-03-ps5-en-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-screen-05-ps5-en-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-screen-04-ps5-en-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-screenshot-hogsmeade-shop-01-en-13sep22?$1600px$'),


('Dead Island 2','1 player, Action',
'Dead Island is back, and with it comes a host of enhancements to its winning combination ofcreative first-person zombie slaying, pitch-black humour and open-world exploration.
    
Welcome to HELL-A. The City of Angels has been transformed into a hellish sprawl, its populacenow mutated into disgusting zombies with an insatiable appetite for humans. In this extensive,visceral RPG experience you’ll journey to iconic LA locations, taking on quests, meeting eccentric survivors and enjoying a joyously pulpy narrative along the way.
    
The game`s brutal melee combat gives you access to an expansive array of inventive zombie-slaying weaponry that lets you slice, smash and tear through the hordes before they get the chance to do the same to you. Can you survive HELL-A?',
65.45,24,
'https://gmedia.playstation.com/is/image/SIEPDC/ps5-games-ratchet-and-clank-rift-apart-image-block-01-en-08apr22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/ratchet-and-clank-rift-apart-hero-banner-desktop-01-en-27jan21?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/ratchet-and-clank-rift-apart-screenshot-05-ps5-en-15jun20?$2400px--t$',
'https://gmedia.playstation.com/is/image/SIEPDC/ratchet-and-clank-rift-apart-screenshot-cz-09-22apr21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/ratchet-and-clank-rift-apart-screenshot-12-en-07may21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/ratchet-and-clank-rift-apart-screenshot-10-en-07may21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/ratchet-and-clank-rift-apart-screenshot-11-en-07may21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/ratchet-and-clank-rift-apart-screenshot-01-ps5-en-15jun20?$1600px$'),


('God of War','1 player , ',
'From Santa Monica Studio comes the sequel to the critically acclaimed God of War (2018). Fimbulwinter is well underway. Kratos and Atreus must journey to each of the Nine Realms in search of answers as Asgardian forces prepare for a prophesied battle that will end the world. Along the way they will explore stunning, mythical landscapes, and face fearsome enemies in the form of Norse gods and monsters. The threat of Ragnarök grows ever closer. Kratos and Atreus must choose between their own safety and the safety of the realms',
42.35,34,
'https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-listing-thumb-01-09sep21$en?$1200px$',
'https://i.pinimg.com/originals/97/7b/d0/977bd09847dea46cd510a9ae26bd233c.png',
'https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-screenshot-clean-06-en-07sept21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-watermark-screenshot-11-en-08sep21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-watermark-screenshot-12-en-08sep21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-watermark-screenshot-03-en-08sep21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-watermark-screenshot-08-en-08sep21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-beauty-shot-01-collectors-edition-en-hk-27jul22?$1600px$'),


('Horizon','1 player , ',
'Experience the majestic world of Horizon like never before in this new adventure for PlayStation®VR2. The stunning visuals and innovative features of the new PS VR2 Sense controllers fully immerse you into the world of Horizon for an experience like no other.

Ascend the towering peaks of the Carja Sundom as Ryas, a disgraced former soldier, and unravel a new mystery surrounding the machines to redeem yourself and save your people. You will also meet Aloy, other familiar faces, and new characters along the way.

Journey back out into the wilds like never before in Horizon Call of the Mountain.',
50.55,21,
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-call-of-the-mountain-keyart-01-en-05jan22?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-hero-banner-desktop-01-en-07may21',
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-screenshot-05-disclaimer-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-screenshot-03-disclaimer-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-screenshot-02-disclaimer-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-screenshot-01-disclaimer-02oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-screenshot-20-en-02feb22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-screenshot-18-en-02feb22?$1600px$'),


('FIFA 23 EA SPORTS FIFA 23','Online play , ',
'EA SPORTS™ FIFA 23 brings The World`s Game to the pitch, with both men’s and women’s FIFA World Cup™ tournaments, the addition of women’s club teams and new ways to play your favourite modes.

Advances in HyperMotion2 Technology bring even more of the action and realism of football to the pitch on PS5. Driven by twice as much real-world motion capture, there is now more true football animation than ever before in every match.',
48.45,43,
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-standard-edition-pack-01-ps4-ps5-en-01aug22?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-standard-edition-hero-banner-desktop-01-ps4-ps5-en-05jul22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-screen-03-ps4-ps5-en-05jul22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-screen-04-ps4-ps5-en-05jul22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-screen-01-ps4-ps5-en-05jul22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-womens-football-screen-03-ps4-ps5-en-02march23?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-world-cup-team-usa-screen-03-ps4-ps5-en-11nov22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-world-cup-mexico-screen-04-ps4-ps5-en-11nov22?$1600px$'),


('The Last of Us Part I ','Offline play , 1 player , ',
'Experience the emotional storytelling and unforgettable characters in The Last of Us, winner of over 200 Game of the Year awards.

In a ravaged civilisation, where infected and hardened survivors run rampant, Joel, a weary protagonist, is hired to smuggle 14-year-old Ellie out of a military quarantine zone. However, what starts as a small job soon transforms into a brutal cross-country journey.

Includes the complete The Last of Us single-player story and celebrated prequel chapter, Left Behind, which explores the events that changed the lives of Ellie and her best friend Riley forever.',
42.25,20,
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-keyart-01-en-18may22?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-hero-banner-desktop-01-en-18may22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-screenshot-10-en-17may22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-screenshot-11-en-17may22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-screenshot-03-en-17may22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-screenshot-02-en-17may22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-screenshot-06-en-17may22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-screenshot-05-en-17may22?$1600px$'),


('Dead Space','Offline play , 1 player , ',
'Isaac Clarke is an everyman engineer on a mission to repair a vast Planet Cracker-class ship, the USG Ishimura, only to discover something has gone horribly wrong. The ship`s crew has been slaughtered and Isaac’s beloved partner, Nicole, is lost somewhere on board.

Now alone and armed with only his engineering tools and skills, Isaac races to uncover the nightmarish mystery of what happened aboard the Ishimura in hopes of finding Nicole. Trapped with hostile creatures called Necromorphs, Isaac faces a battle for survival, not only against the escalating terrors of the ship but his own crumbling sanity.',
43.65,31,
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-pack-01-en-29sep22?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-hero-banner-desktop-01-en-29sep22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-screeshot-02-en-09sep22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-launch-screenshot-02-en-18jan23?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-screeshot-01-en-09sep22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-launch-screenshot-06-en-18jan23?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-launch-screenshot-03-en-18jan23?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/dead-space-launch-screenshot-01-en-18jan23?$1600px$'),


('Gran Turismo 7','Online play , 1 - 2 players',
'Whether you`re a competitive or casual racer, collector, tuner, livery designer or photographer – find your line with a staggering collection of game modes including fan-favourites like GT Campaign, Arcade and Driving School.

With the reintroduction of the legendary GT Simulation Mode, buy, tune and race your way through a rewarding solo campaign as you unlock new cars and challenges. And if you love going head-to-head with others, hone your skills and compete in the GT Sport Mode.

With over 420 cars available at Brand Central and the Used Car Dealership from day one, Gran Turismo® 7 recreates the look and feel of classic motors and bleeding-edge supercars alike in unparalleled detail. Each car handles differently and feels unique as you navigate over 90 track routes in dynamic weather conditions, including classic courses from GT history.',
53.20,23,
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-packshot-01-en-09sep21?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-hero-banner-desktop-01-en-29sep21',
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-background-block-desktop-01-en-12jun20?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-screenshot-07-en-09sept21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-screenshot-12-en-09sept21?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-screenshot-07-disclaimer-en-01oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-screenshot-01-disclaimer-en-01oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-screenshot-02-disclaimer-en-01oct20?$1600px$'),


('Marvel`s Spider-Man 2','Offline play , 1 player , ',
'Marvel`s Spider-Man 2 is the next game in PlayStation`s critically acclaimed Marvel’s Spider-Man franchise. Developed by Insomniac Games for the PlayStation 5 console in collaboration with PlayStation and Marvel Games.',
45.6,32,
'https://gmedia.playstation.com/is/image/SIEPDC/marvels-spider-man-2-thumbnail-02-en-01oct21?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/spider-man-2-desktop-02-en-26oct21?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/spider-man-2-desktop-01-en-26oct21?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/marvels-spider-man-screen-01-ps4-us-12jun17?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/marvels-spiderman-remastered-screenshot-04-disclaimer-en-01oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/spider-man-2-reveal-venom-4K-legal_2022-en-12dec22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/spiderman-miles-morales-screenshot-01-disclaimer-en-01oct20?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/spider-man-2-reveal-heroes-4K-legal_2022-en-12dec22?$1600px$'),


('Assassin`s Creed Mirage','Offline play , 1 player , ',
'Experience the home of the original Assassins in this exciting new narrative-driven, open world adventure.

15 years since the first Assassin`s Creed redefined adventure, experience the franchises` trademark parkour and stealth like never before - in Assassin`s Creed Mirage. 

In this smaller scale, back to basics Assassin`s caper, you play Basim, a young street thief seeking answers. Roam the richly-detailed, reactive and vibrant streets of 9th century Baghdad, uncovering the mysteries of the past as you fight to secure your future.

Stalk the shadows. Become the ultimate assassin.',
35.90,42,
'https://gmedia.playstation.com/is/image/SIEPDC/assassins-creed-mirage-store-artwork-01-en-19oct22?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/Assassins-creed-mirage-hero-desktop-01-en-25oct22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/Assassins-creed-mirage-background-block-desktop-01-en-25oct22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/assassins-creed-mirage-screenshot-05-en-19oct22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/assassins-creed-mirage-screenshot-02-en-19oct22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/assassins-creed-mirage-screenshot-03-en-19oct22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/assassins-creed-mirage-screenshot-01-en-19oct22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/Assassins-creed-mirage-background-block-desktop-01-en-25oct22?$2400px$'),


('Street Fighter 6','Online play , 1-2 players ',
'Street Fighter 6 is the next evolution of the Street Fighter series, and features innovative new gameplay features, plus enhanced visuals for every aspect of the game.

Powered by Capcom`s proprietary RE ENGINE, the Street Fighter 6 experience spans across three distinct game modes - Fighting Ground, World Tour and Battle Hub.

Your path to becoming a World Warrior starts here.

Your moment. Your fight.',
43.6,14,
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-pack-01-ps4-ps5-02sep22?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-hero-banner-desktop-01-en-07dec22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-screen-03-ps4-ps5-en-02sep22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-screen-23-ps4-ps5-en-21nov22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-screen-18-ps4-ps5-en-21nov22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-screen-09-ps4-ps5-en-02sep22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-screen-28-ps4-ps5-en-21nov22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/street-fighter-6-screenshot-11-13sep22?$1600px$'),


('Diablo IV','Online play , ',
'The legendary action RPG series returns with Diablo IV. This spectacular evolution introduces a vast new world to explore, filled with the promise of never-ending adventure, deadly demons and legendary loot.

Discover the corrupted land of Sanctuary as it falls into a new era of darkness. Lilith, daughter of Mephisto, Lord of Hatred, has been freed from exile and now her hateful influence threatens to consume the world. Only you and your fellow adventurers stand between Lilith and Sanctuary’s ruin.

Explore Sanctuary solo or with friends as your progress through Diablo IV’s engrossing campaign, taking on quests, liberating towns and battling epic bosses. In true Diablo fashion, an expansive end game awaits; players can meet in the game’s shared world to trade, team up, or test their might in lobby-free PVP zones. Cross-play, cross-progression and couch co-op allow you to continue the adventure whenever, wherever. ',
53.25,24,
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-pack-01-en-12dec22?$1200px$',
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-hero-banner-desktop-01%E2%80%93en-12dec22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-screen-06-en-13dec22?$2400px$',
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-screen-05-en-10dec22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-screen-11-en-13dec22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-screen-08-en-13dec22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-screen-07-en-13dec22?$1600px$',
'https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-screen-10-en-13dec22?$1600px$'),


('Skull and Bones','Online play ,',
'Enter the perilous paradise of Skull and Bones, inspired by the Indian Ocean during the Golden Age of Piracy.

Craft a variety of unique ships to survive, thrive and rule in an immersive world that introduces new challenges and features every season.

Be wary in this untamed open world - there are predators lurking around every corner.

Long live piracy!',
46.95,35,
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-pack-01-ps4-ps5-08jul22$en?$1200px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-hero-banner-desktop-01-ps4-ps5-en-29jun22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-screen-04-ps4-ps5-en-29jun22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-screen-03-ps4-ps5-en-29jun22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-screen-02-ps4-ps5-en-29jun22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-screen-01-ps4-ps5-en-29jun22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-screen-01-ps4-ps5-en-29jun22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/skull-and-bones-screen-02-ps4-ps5-en-29jun22?$1600px$'),


('Silent Hill 2','Offline play , ',
'Experience a master class in psychological survival horror - lauded as the best in the series - on the latest hardware with chilling visuals and visceral sounds.

Take on the role of James Sunderland and venture into the mostly-deserted town of Silent Hill in this highly anticipated remake of the 2001 classic. Drawn to this mysterious place by a letter from his wife who died three years previously, James searches the town for clues as to why he received this impossible letter.

Enter a dream-like world and encounter twisted monsters, the menacing Pyramid Head and a seemingly-ordinary cast of characters wrestling with their past.

As James comes to terms with his own turmoil, he`ll be left with one question - why did he really come to Silent Hill?',
42,22,
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-pack-01-en-14nov22?$1200px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-hero-banner-desktop-01-en-04oct22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-screen-05-en-06oct22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-screen-07-en-06oct22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-screen-08-en-06oct22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-screen-04-en-06oct22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-screen-03-en-06oct22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-screen-02-en-06oct22?$1600px$'),


('STAR WARS Jedi: Survivor','Offline play',
'STAR WARS Jedi: Survivor™ picks up five years after the events of STAR WARS Jedi: Fallen Order™. Cal must stay one step ahead of the Empire’s constant pursuit as he continues to feel the weight of being one of the last remaining Jedi in the galaxy.

Developed by the veteran team at Respawn Entertainment, Jedi: Survivor will expand upon iconic STAR WARS stories, worlds, and characters, and thrilling combat first experienced in Jedi: Fallen Order.

STAR WARS Jedi: Survivor is being built for the current generation of gaming hardware to create a deeper and more expansive STAR WARS experience for players worldwide when the game launches in 2023.',
55.45,32,
    'https://www.playstation.com/en-vn/games/star-wars-jedi-survivor/',
    'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-fallen-order-hero-01-ps4-en-25aug20?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-fallen-order-overview-section-background-01-ps4-en-25aug20?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-fallen-order-key-features-section-background-01-ps4-en-26apr19?$2400px--t$',
    'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-fallen-order-screenshot-03-en-15dec22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-fallen-order-screenshot-04-en-15dec22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-fallen-order-screenshot-06-ps4-en-01nov19?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/star-wars-jedi-fallen-order-screenshot-02-en-15dec22?$1600px$'),


('Resident Evil 4','1 player , Offline play , ',
'Resident Evil 4, 2005`s legendary survival horror, is brought fully up-to-date in this ground-up remake.

Six years after the events of Resident Evil 2, Raccoon City survivor Leon Kennedy has been dispatched to a secluded European village to investigate the disappearance of the US president’s daughter. What he discovers there is unlike anything he has faced before.

Every aspect of the classic game has been updated for the current generation, from modernised graphics and controls, to a reimagined storyline that may surprise even hardened fans of the original game.',
75.45,26,
    'https://image.api.playstation.com/vulcan/ap/rnd/202210/0706/EVWyZD63pahuh95eKloFaJuC.png?w=1200',
    'https://gmedia.playstation.com/is/image/SIEPDC/RE4-remake-hero-desktop-02-en-09nov22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/resident-evil-4-remake-screen-01-ps5-en-15jun22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/resident-evil-4-remake-screen-04-ps5-en-15jun22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/resident-evil-4-remake-screen-06-ps5-en-01nov22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/resident-evil-4-remake-screen-07-ps5-en-01nov22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/resident-evil-4-remake-screen-09-ps5-en-01nov22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/resident-evil-4-remake-screen-10-ps5-en-01nov22?$1600px$'),


('Firewall Ultra','Online play , ',
'Enlist as an elite contractor and squad up for PVP and PVE multiplayer missions in this tactical first-person shooter, developed by First Contact Entertainment for PlayStation®VR2.',
45.85,34,
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-packshot-desktop-01-en-05sep22?$1200px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-hero-banner-desktop-01-en-09feb23?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-background-block-desktop-01-en-09feb23?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-screenshot-02-en-02sept22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-keyart-03-en-14feb23?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-keyart-03-en-14feb23?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-keyart-03-en-14feb23?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/firewall-ultra-keyart-03-en-14feb23?$1600px$'),


('Suicide Squad','Online play , ',
'Suicide Squad: Kill the Justice League, is a genre-defying, action-adventure third-person shooter from Rocksteady Studios, creators of the critically acclaimed Batman: Arkham series. 

Featuring an original narrative set within an expansive open-world city of Metropolis, Suicide Squad: Kill the Justice League puts the four DC Super-Villains on a collision course with an invading alien force and DC Super Heroes who are now laser-focused on destroying the city they once vowed to protect. All the while, the Suicide Squad must be mindful of the lethal explosives implanted in their heads that could go off at the first sign of defiance.

Each squad member has their own unique move set with enhanced traversal abilities to freely explore the dynamic open-world of Metropolis, along with a variety of weapons to customize, and skills to master. 

Take down The Justice League yourself in single-player or team up with friends in multiplayer co-op.

Don`t be a hero.',
62.5,34,
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-KtJL-storeart-01-en-9dec21?$1200px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-hero-banner-desktop-01-en-13dec21?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-KtJL-background-01-en-9dec21?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-kill-the-justice-league-screen-03-ps4-ps5-en-18nov21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-kill-the-justice-league-screen-02-ps4-ps5-en-18nov21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-kill-the-justice-league-screen-04-ps4-ps5-en-18nov21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-kill-the-justice-league-screen-01-ps4-ps5-en-18nov21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-kill-the-justice-league-screen-01-ps4-ps5-en-18nov21?$1600px$'),


('Final Fantasy XVI','1 player , ',
'The 16th standalone entry in the legendary Final Fantasy series marks a darker turn for the RPG franchise, with a complex tale of revenge, power struggles and unavoidable tragedy.

Final Fantasy XVI reimagines the series iconic summons as Eikons. These deadly creatures are housed within Dominants, men and women who inherit their immense power at birth - whether they like it or not.

Eikons are the most powerful beings in Valisthea, a land where six powerful realms have emerged thanks to the power of the Mothercrystals. The aether provided by these towering mountains of crystal powers the magicks that have allowed these nations to thrive for many years — but now a mysterious Blight threatens to disrupt their uneasy alliance.

Play as Clive Rosfield, First Shield of Rosaria and guardian of his younger brother Joshua, the Dominant of the Eikon Phoenix, in this epic action RPG from a team of Final Fantasy veterans.',
42,13,
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-pack-01-ps5-en-30aug22?$1200px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-hero-banner-desktop-03-en-30nov22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-background-desktop-01-en-01dec22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-screenshot-04-en-24nov22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-screenshot-09-en-24nov22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-screenshot-11-en-01dec22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-screenshot-15-en-01dec22?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/final-fantasy-xvi-screenshot-13-en-01dec22?$1600px$'),


('ELDEN RING','Online play , 1 player , ',
'In the Lands Between ruled by Queen Marika the Eternal, the ELDEN RING, the source of the Erdtree, has been shattered.

Marika`s offspring, demigods all, claimed the shards of the ELDEN RING known as the Great Runes, and the mad taint of their newfound strength triggered a war: The Shattering. A war that meant abandonment by the Greater Will.

And now the guidance of grace will be brought to the Tarnished who were spurned by the grace of gold and exiled from the Lands Between.

Ye dead who yet live, your grace long lost, follow the path to the Lands Between beyond the foggy sea to stand before the ELDEN RING.

And become the Elden Lord.',
85.35,25,
    'https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-store-art-01-ps5-03sep21$en?$1200px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-hero-banner-desktop-01-en-24jan22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/Elden-ring-background-block-en-01-25jan22?$2400px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-screenshot-02-en-15jun21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-screenshot-05-en-15jun21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-screenshot-04-en-15jun21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-screenshot-06-en-15jun21?$1600px$',
    'https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-screenshot-08-en-15jun21?$1600px$')