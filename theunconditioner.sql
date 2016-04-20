CREATE DATABASE theunconditioner;

#connecting the database
\c theunconditioner

CREATE TABLE topics (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  image_url VARCHAR(500),
  summary VARCHAR(1000)
);

#Hardcoding in the topics
INSERT INTO topics (name, image_url, summary) VALUES ('Female Beauty', 'http://i.imgbox.com/5pBlTjMv.png', 'Lets talk about Beauty! Forever conditioned by the media and our surrounds to believe that there is a certain look that is beauty, lets uncondition that and realise that all people, everywhere, are beautiful.');
INSERT INTO topics (name, image_url, summary) VALUES ('Male PDS', 'http://i.imgbox.com/N17UBGo3.png', 'Lets talk about guys kissing other guys! Not a homophobe but still find it weird to look at other guys being affectionate with eachother? Lets uncondition that and realise that all people, everywhere, can show their love.');
INSERT INTO topics (name, image_url, summary) VALUES ('Healthy Food', 'http://i.imgbox.com/U7hRYsWy.png', 'Lets talk about healthy food! Namely fruit and vegetables! Forever conditioned by the media and our surrounds to believe that lollies and softdrinks and shit are delicious, lets uncondition that and realise that all natural food, everywhere, is yummy.');

CREATE TABLE users (
id SERIAL4 PRIMARY KEY, 
email VARCHAR(50) NOT NULL,
password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE cards (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(50),
  image_url VARCHAR(500),
  text_msg VARCHAR(1000),
  topic_id INTEGER
);

#Hardcoding in the beautiful topic cards
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('beauty1', 'http://cdn.americanbanker.com/media/gallery/p19ve63slmjejq8k1d011eqld3p6.jpg', 'Still Beautiful', 1);
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('beauty2', 'http://i.telegraph.co.uk/multimedia/archive/02624/Kelly_Hoppen_MBE_-_2624218b.jpg', 'Curls are Cool', 1);
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('beauty3', 'http://www.lifetimetv.co.uk/sites/default/files/styles/max845/public/assets/landscape/38917626_LWNY-7049.jpg', 'Stunning!', 1);

#Hardcoding in the men kissing cards
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('psamen1', 'https://sacredtwospirits.files.wordpress.com/2013/06/two-men-kissing.jpg', 'Love!', 2);
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('psamen2', 'http://farm8.static.flickr.com/7099/7253821550_526801d903_m.jpg', 'Totes cool!', 2);
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('psamen3', 'http://www.rawstory.com/wp-content/uploads/2015/02/shutterstock_140826010-800x430.gif', 'World did not explode!', 2);

#Hardcoding in the healthy food cards.
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('healthyfood1', 'http://cdn1.medicalnewstoday.com/content/images/articles/245259-broccoli.jpg', 'Yummy!', 3);
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('healthyfood2', 'http://hdwyn.com/thumbnail/apples_leaf_tail_white_background_hd-wallpaper-76376.jpg', 'Delicious!!', 3);
INSERT INTO cards (name, image_url, text_msg, topic_id) VALUES ('healthyfood3', 'http://orig01.deviantart.net/44ce/f/2015/257/2/5/simon_andrew_casey___avocado_is_an_healthy_food_by_simonandrewcasey-d99jll2.jpg', 'Awesome!', 3);

CREATE TABLE completes (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  topic_id INTEGER
);

INSERT INTO completes (user_id, topic_id) VALUES (1,2);

-- DELETE FROM completes WHERE user_id=1;

