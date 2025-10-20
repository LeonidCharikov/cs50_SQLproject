-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- SELECT all songs by Travis Scott
SELECT * FROM "songs"
INNER JOIN "song_artist" ON songs.id = song_artist.song_id
INNER JOIN "artists" ON artists.id = song_artist.artist_id
WHERE artists.name = "Travis Scott";

-- SELECT all songs with artists names from playlist created by user with nickname
SELECT songs.name AS "Song Name", artists.name AS "Artist" FROM "songs"
INNER JOIN "song_playlist" ON songs.id = song_playlist.song_id
INNER JOIN "playlists" ON playlists.id = song_playlist.playlist_id
INNER JOIN "song_artist" ON songs.id = song_artist.song_id
INNER JOIN "artists" ON artists.id = song_artist.artist_id
WHERE playlists.user_id IN (SELECT "id" FROM "users" WHERE "nickname" = "leo_charikov");

-- SELECT all songs from one album
SELECT songs.name FROM "songs"
INNER JOIN "song_album" ON songs.id = song_album.song_id
INNER JOIN "albums" ON albums.id = song_album.album_id
WHERE albums.id IN (SELECT albums.id FROM "albums" WHERE albums.name = "ASTROWORLD");


-- INSERT of artists
INSERT INTO "artists" ("id", "name") VALUES (1, "DJ Stonik1917"), (2,"Big Baby Tape"),(3, "C418"),(4, "bbno$"),(5,"Travis Scott"),(6, "5opka");
-- INSERT of songs
INSERT INTO "songs" ("id","name","duration_seconds","release_date", "genre") VALUES (1, "Venom Boy", 132, "2025", "POP"), (2, "SICKO MODE", 313, "2018", "RAP");
-- Insert of albums
INSERT INTO "albums"("id", "name", "release_date") VALUES (1,"ASTROWORLD","2018");
-- Insert of playlists
INSERT INTO "playlists" ("id", "name", "user_id") VALUES (1, "my fav", 1),(2, "remixes", 2);
-- Insert of connection between playlist and song
INSERT INTO "song_playlist" ("song_id", "playlist_id") VALUES (1,1) , (2,1);
-- Insert connection between song and album
INSERT INTO "song_album" ("song_id", "album_id") VALUES (2,1);
-- Insert connection between album and artist
INSERT INTO "album_artist" ("artist_id", "album_id", "is_featured") VALUES (5,1,0);
-- Insert connection between song and artist
INSERT INTO "song_artist" ("artist_id", "song_id", "is_featured") VALUES (5,2,0);

