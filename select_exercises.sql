 -- Exercise for Basic Statements.
 
-- open albums database
use albums_db;
-- Explore the structure of the albums table.
 -- explored

-- looking into information albums table.
Describe `albums`;

-- ----- Exercises---------------------------------

-- a.How many rows are in the albums table?
-- answer 31 rows.
Select *
from albums;

-- b. How many unique artist names are in the albums table?
 -- answer :23
select distinct artist
from albums;

 
-- c. What is the primary key for the albums table?
  -- answer: id
  Describe albums;


-- d. What is the oldest release date for any album in the albums table? What is the most recent release date? 
-- answer: 1967 oldest, 2011 Newest
select distinct release_date
from albums
order by release_date;



-- a. The name of all albums by Pink Floyd
-- Answer: The Darkside of the Moonlight, The Wall
select name
from albums 
where artist = 'Pink Floyd';


-- b.The year Sgt. Pepper's Lonely Hearts Club Band was released
-- answer: 1967
select distinct release_date, name 
from albums 
where artist = 'The Beatles';

-- c. The genre for the album Nevermind
-- answer Grunge, Alternative rock
select distinct genre, artist
from albums
where name = "Nevermind";


-- d. Which albums were released in the 1990s

 /* 11 in total: The bodyguard-whitney, jagged little pill-Alanis, come on over-shania, falling into you-Celine Dion, Lets talk about love - Celine Dion, Dangerous - Micheal Jackson, The immaculate collection - madonna, Titanic music from motion picture - James Horner, Metallica - Metallica, Neverminde - Nirvana, sueprnatural - Santana*/
 select * 
from albums
where release_date between 1990 and 1999;


-- e. Which albums had less than 20 million certified sales
-- answer: /* 13 in total: Grease: The Original Soundtrack, Bad, Sgt.Peppers Lonely Hearts Club Band, Dirty Dancing, Lets Talk About Love, Dangerous, The Immaculate Collection, Abbey Road, Born in the U.S.A, Brothers in Arms, Titanic: Music from the Motion Pictures, Nevermind, The Wall*/
select *
from albums 
where sales < 20;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? */
-- Answer: have to specifiy the the strings. SQL is reading that I only want to take in "Rock".

select *
from albums 
where genre = "Rock";