-- 1. Awesome Chocolates
USE `awesome chocolates`;
SHOW TABLES;
-- 1. World
USE world;
SHOW TABLES;


-- 1. SELECT, DISTINCT va AS
-- 1.1. country jadvalidan mamlakat nomi, aholi soni va maydonini chiqaring.
-- SELECT name, Population, SurfaceArea from country;

-- 1.2. country jadvalidan mamlakat nomi, aholi soni va o'rtacha umr ko'rish davomiyligidan 5 ayirilgan qiymatni chiqaring. Yangi ustunga umr_minus_5 nomini bering. Ba'zi qatorlarda natija nega NULL chiqqanini tushuntiring.
-- SELECT name , Population, LifeExpectancy - 5 as umr_minus_5 from country;
-- 1.3. country jadvalida qaysi qit'alar keltirilgan? Har bir qit'a bir marta chiqsin.
-- SELECT DISTINCT Continent FROM country;
-- 1.4. country jadvalidagi mamlakatlarda qanday boshqaruv shakllari (GovernmentForm) mavjud?
-- SELECT DISTINCT GovernmentForm  from country
-- 1.5. city jadvalida qanday mamlakat kodlari () mavjud?
-- SELECT Code from country
-- 1.6. country jadvalidan mamlakat nomi va aholi zichligini (aholi soni / maydon) chiqaring. Hisoblangan ustunga zichlik nomini bering.
-- SELECT name , Population / SurfaceArea as zichlik from country
-- 1.7. chinook: InvoiceLine jadvalidan InvoiceId va har bir qatordan tushgan tushumni (UnitPrice × Quantity) revenue nomi bilan chiqaring.

-- 2. Chinook
USE chinok;
SHOW TABLES;

-- SELECT InvoiceId, (UnitPrice* Quantity) as revenue
-- FROM invoiceline;

-- 2. WHERE
-- 2.1. city jadvalidan mamlakat kodi AFG bo'lgan shaharlarning barcha ma'lumotlarini chiqaring.

-- SELECT *
-- FROM world.city
-- WHERE CountryCode = "AFG"
-- 2.2. city jadvalidan Preston shahrining aholi sonini toping.
-- SELECT name, Population
-- FROM world.city
-- WHERE name = "Preston"
-- 2.3. city jadvalidan ID raqami 45 bo'lgan shaharning mamlakat kodi va aholi sonini aniqlang.
-- SELECT * from world.city where id=45
-- 3. Taqqoslash operatorlari
-- 3.1. country jadvalidan aholisi 24 000 000 dan ko'p bo'lgan mamlakatlarning nomi va qit'asini chiqaring.
-- SELECT name, Continent , Population from world.country WHERE Population>24000000
-- 3.2. country jadvalidan 1900-yildan oldin mustaqil bo'lgan mamlakatlarning nomi va mustaqillik yilini chiqaring.
-- SELECT name,indepYear FROM  world.country WHERE indepYear< 1900
-- 4. Mantiqiy operatorlar: AND, OR, NOT
-- 4.1. countrylanguage jadvalidan ingliz tili norasmiy til hisoblangan mamlakatlarning kodlarini chiqaring.
-- SELECT * from world.countrylanguage WHERE Language="English" and IsOfficial='T'
-- 4.2. country jadvalidan boshqaruv shakli aynan 'Republic' bo'lgan va 1980-yildan oldin mustaqillikka erishgan mamlakatlar ro'yxatini chiqaring.
-- SELECT * FROM world.country WHERE GovernmentForm="Republic" and IndepYear <1980
-- 4.3. country jadvalidan Osiyo yoki Yevropada joylashgan va aholisi 50 000 000 dan kam bo'lgan mamlakatlarning nomi va maydonini chiqaring.
-- SELECT * FROM world.country WHERE Continent="Asia"or  Continent="Europe" and Population <50000000
-- 4.4. NOT operatori bilan: Osiyoda joylashmagan va aholisi 100 000 000 dan ko'p bo'lgan mamlakatlarning nomi, qit'asi va aholisini chiqaring.
-- SELECT name, Continent FROM world.country WHERE not Continent="Asia"and Population <100000000

-- 5. BETWEEN

-- 5.1. city jadvalidan aholisi 900 000 dan 1 000 000 gacha bo'lgan shaharlarning barcha ma'lumotlarini chiqaring.
-- SELECT * from world.city where Population BETWEEN 900000  and 1000000
-- SELECT * from world.city WHERE Population BETWEEN 900000 and 1000000
-- 5.2. country jadvalidan aholisi 10 000 000 dan 30 000 000 gacha va o'rtacha umr ko'rish davomiyligi 70 dan 75 yoshgacha bo'lgan mamlakatlarning barcha ma'lumotlarini chiqaring.
-- SELECT * from world.country WHERE Population BETWEEN 10000000 and 30000000 and LifeExpectancy BETWEEN 70 and 75
-- 5.3. countrylanguage jadvalidan rasmiy tilda so'zlashuvchilar ulushi 90% dan 100% gacha bo'lgan mamlakatlarning kodi, tili va ulushini chiqaring.
-- SELECT CountryCode,Language, Percentage, IsOfficial from world.countrylanguage WHERE Percentage BETWEEN 90 and 100 and IsOfficial="T"

-- 6. IN va NOT IN
-- 6.1. country jadvalidan Osiyo, Yevropa va Janubiy Amerikada joylashgan mamlakatlarning barcha ma'lumotlarini chiqaring.
--  SELECT * from world.country WHERE Continent in ("Asia","Europe","South America")
-- 6.2. country jadvalidan Osiyo va Yevropadan tashqari qit'alardagi mamlakatlarning nomi, qit'asi va maydonini chiqaring.
-- SELECT * from world.country WHERE Continent  not in ("Asia","Europe")

-- 7. LIKE

-- 7.1. country jadvalidan nomi "stan" bilan tugaydigan mamlakatlarni chiqaring. Natijada Qozog'iston bormi? Bazada u qanday yozilgan?
-- SELECT * from world.country WHERE name like "%stan"
-- 7.2. city jadvalidan nomi "San " (oxirida bo'sh joy bilan) boshlanadigan shaharlarning nomi va mamlakat kodini chiqaring.
-- SELECT * FROM world.country WHERE name like "San %"
-- 7.3. country jadvalidan nomi aynan 5 ta harfdan iborat mamlakatlarni chiqaring.
-- SELECT * from world.country WHERE name like "_____"
-- 7.4. country jadvalidan kodi (Code) A harfi bilan boshlanadigan mamlakatlarning kodi va nomini chiqaring.
--  SELECT * from world.country WHERE Code like "A%"
--  7.5. city jadvalidan O'zbekiston (UZB) shaharlari ichida nomi "kent" bilan tugaydiganlarini chiqaring. Toshkent bazada qanday yozilgan?
-- SELECT * from world.city WHERE  name like "%kent" AND CountryCode="UZB"
-- 7.6. Noto'g'ri usulni toping: umr ko'rish davomiyligi 70 dan 80 gacha bo'lgan mamlakatlarni ikki usulda toping: a) LifeExpectancy LIKE '7%'; b) BETWEEN bilan. Qatorlar soni bir xil chiqdimi? Nega sonlar uchun LIKE ishlatish yomon odat?
-- a SELECT * from world.country WHERE  LifeExpectancy like "7%" 
-- b SELECT * from world.country WHERE LifeExpectancy  BETWEEN 70 and 80;
-- sabab: balki 700 bolsa ham 70 deb o'ylayveradi yoki 7 bo'lsa ham bu malumotlarni to'g'ri sortlay olmaydi

-- 8. IS NULL

-- 8.1. country jadvalidan mustaqillik yili ko'rsatilmagan (NULL) mamlakatlarning nomi va qit'asini chiqaring.
-- SELECT name,Continent, IndepYear from world.country WHERE IndepYear is null    
-- 8.2. chinook: Customer jadvalidan kompaniyada ishlaydigan (Company ko'rsatilgan) mijozlarning ismi, familiyasi va kompaniyasini chiqaring.
-- SELECT FirstName, LastName, Company from chinok.customer WHERE not Company  is NULL
-- 9. Biznes savoli
-- 9.1. Xalqaro tashkilot aholisi 10 000 000 dan 30 000 000 gacha, o'rtacha umr ko'rish davomiyligi esa 70 yoshdan past bo'lgan mamlakatlarda sog'liqni saqlash loyihasini boshlamoqchi. Qaysi mamlakatlar mos keladi? Natija bo'yicha bir jumla xulosa yozing: mamlakatlar asosan qaysi qit'ada?
-- SELECT * from world.country WHERE Population BETWEEN 10000000 and 30000000 and LifeExpectancy<70
-- -- 3. Sakila
-- USE sakila;
-- SHOW TABLES; 
-- South America