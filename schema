-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- users TABLE
CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "nickname" TEXT UNIQUE NOT NULL,
    "password" TEXT,
    PRIMARY KEY("id")
);


-- songs TABLE
CREATE TABLE "songs" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "duration_seconds" INTEGER NOT NULL,
    "release_date" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    PRIMARY KEY ("id")
);


-- artists TABLE
CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);


-- albums TABLE
CREATE TABLE "albums" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    PRIMARY KEY ("id")
);


-- playlist TABLE
CREATE TABLE "playlists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "user_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- connection TABLE between song and playlist
CREATE TABLE "song_playlist" (
     "song_id" INTEGER,
     "playlist_id" INTEGER,
     PRIMARY KEY ("song_id", "playlist_id"),
     FOREIGN KEY ("song_id") REFERENCES "songs"("id") ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- connection TABLE between song and album
CREATE TABLE "song_album" (
     "song_id" INTEGER,
     "album_id" INTEGER,
     PRIMARY KEY ("song_id", "album_id"),
     FOREIGN KEY ("song_id") REFERENCES "songs"("id") ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY ("album_id") REFERENCES "albums"("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- connection TABLE between artist and album
CREATE TABLE "album_artist" (
     "artist_id" INTEGER,
     "album_id" INTEGER,
     "is_featured" BOOLEAN,
     PRIMARY KEY ("artist_id", "album_id"),
     FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY ("album_id") REFERENCES "albums"("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- connection TABLE between artist and song
CREATE TABLE "song_artist" (
     "artist_id" INTEGER,
     "song_id" INTEGER,
     "is_featured" BOOLEAN,
     PRIMARY KEY ("artist_id", "song_id"),
     FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY ("song_id") REFERENCES "songs"("id") ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE INDEX "idx_users_nickname" ON "users"("nickname");
CREATE INDEX "idx_songs_name" ON "songs"("name");
CREATE INDEX "idx_artists_name" ON "artists"("name");
CREATE INDEX "idx_albums_name" ON "albums"("name");
CREATE INDEX "idx_playlists_user_id" ON "playlists"("user_id");
CREATE INDEX "idx_songs_in_playlist_id" ON "song_playlist"("playlist_id");
CREATE INDEX "idx_song_in_album_id" ON "song_album"("album_id");
CREATE INDEX "idx_artist_album_id" ON "album_artist"("album_id");
CREATE INDEX "idx_artist_song_id" ON "song_artist"("song_id");


-- View that shows information about songs
CREATE VIEW "song_details" AS
SELECT songs.id AS "ID", songs.name AS "Name", songs.duration_seconds AS "Duration",
songs.release_date AS "Release", songs.genre, artists.name AS "Artist", song_artist.is_featured FROM "songs"
INNER JOIN "song_artist" ON songs.id = song_artist.song_id
INNER JOIN "artists" ON artists.id = song_artist.artist_id;

-- View that shows information about songs in albums
CREATE VIEW "song_album_details" AS
SELECT songs.id, songs.name, albums.id, albums.name, albums.release_date FROM "songs"
INNER JOIN "song_album" ON songs.id = song_album.song_id
INNER JOIN "albums" ON albums.id = song_album.album_id;

-- View that shows information about albums
CREATE VIEW "album_details" AS
SELECT albums.id, albums.name, albums.release_date, artists.id, artists.name, album_artist.is_featured FROM "albums"
INNER JOIN "album_artist" ON albums.id = album_artist.album_id
INNER JOIN "artists" ON artists.id = album_artist.artist_id;

-- View that shows statistics from all database
CREATE VIEW "music_statistics" AS
SELECT (SELECT COUNT(*) FROM "songs") as "total_songs",
    (SELECT COUNT(*) FROM "artists") as "total_artists",
    (SELECT COUNT(*) FROM "albums") as "total_albums",
    (SELECT COUNT(*) FROM "playlists") as "total_playlists",
    (SELECT COUNT(*) FROM "users") as "total_users",
    (SELECT AVG("duration_seconds") FROM "songs") as "avg_song_duration_seconds",
    (SELECT name FROM "songs" ORDER BY "duration_seconds" DESC LIMIT 1) as "longest_song";

--
