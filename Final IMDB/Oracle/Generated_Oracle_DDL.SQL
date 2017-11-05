/*
Created: 04-12-2016
Modified: 04-12-2016
Model: IMDB_Oracle
Database: Oracle 11g Release 1
*/




-- Create tables section -------------------------------------------------

-- Table Movie

CREATE TABLE "Movie"(
  "MovieID" Integer NOT NULL,
  "StatusID" Integer NOT NULL,
  "CertificateID" Integer NOT NULL,
  "Name" Varchar2(50 ) NOT NULL,
  "Rating" Float,
  "UserVotes" Integer,
  "Metascore" Integer,
  "StoryLine" Varchar2(500 ) NOT NULL,
  "Runtime" Varchar2(50 ),
  "Color" Varchar2(20 ),
  "NegativeFormat" Varchar2(100 ),
  "Budget" Float NOT NULL,
  "IsAmazonAvailableFlag" Raw(1),
  "ReleaseDate" Date NOT NULL,
  "Rank" Integer,
  "Camera" Varchar2(150 ),
  "Laboratory" Varchar2(200 ),
  "Cinematography" Varchar2(200 ),
  "PrintedFilmFormat" Varchar2(100 ),
  "MovieYear" Varchar2(4 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Movie

CREATE INDEX "IX_Relationship5" ON "Movie" ("StatusID")
/

CREATE INDEX "IX_Relationship99" ON "Movie" ("CertificateID")
/

-- Add keys for table Movie

ALTER TABLE "Movie" ADD CONSTRAINT "Key97" PRIMARY KEY ("MovieID")
/

-- Table MovieTrailer

CREATE TABLE "MovieTrailer"(
  "TrailerID" Integer NOT NULL,
  "Name" Varchar2(50 ) NOT NULL,
  "ReleaseDate" Date NOT NULL,
  "Rating" Float,
  "TrailerNum" Integer NOT NULL,
  "MovieID" Integer NOT NULL,
  "TrailerRunTime" Varchar2(20 ),
  "TrailerLink" Varchar2(100 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieTrailer

CREATE INDEX "IX_Relationship30" ON "MovieTrailer" ("MovieID")
/

-- Add keys for table MovieTrailer

ALTER TABLE "MovieTrailer" ADD CONSTRAINT "Key75" PRIMARY KEY ("TrailerID")
/

-- Table MovieTVStatusRef

CREATE TABLE "MovieTVStatusRef"(
  "StatusID" Integer NOT NULL,
  "Status" Varchar2(30 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table MovieTVStatusRef

ALTER TABLE "MovieTVStatusRef" ADD CONSTRAINT "Key71" PRIMARY KEY ("StatusID")
/

-- Table Review

CREATE TABLE "Review"(
  "ReviewID" Integer NOT NULL,
  "PersonID" Integer NOT NULL,
  "MovieID" Integer,
  "TVShowID" Integer,
  "ReviewType" Varchar2(30 ) NOT NULL,
  "Review" Varchar2(1500 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Review

CREATE INDEX "IX_Relationship12" ON "Review" ("MovieID")
/

CREATE INDEX "IX_Relationship102" ON "Review" ("TVShowID")
/

CREATE INDEX "IX_Relationship111" ON "Review" ("PersonID")
/

-- Add keys for table Review

ALTER TABLE "Review" ADD CONSTRAINT "Key68" PRIMARY KEY ("ReviewID")
/

-- Table Language

CREATE TABLE "Language"(
  "LanguageID" Integer NOT NULL,
  "Language" Varchar2(20 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Language

ALTER TABLE "Language" ADD CONSTRAINT "Key67" PRIMARY KEY ("LanguageID")
/

-- Table ProductionHouse

CREATE TABLE "ProductionHouse"(
  "ProductionID" Integer NOT NULL,
  "ProductioName" Varchar2(50 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ProductionHouse

ALTER TABLE "ProductionHouse" ADD CONSTRAINT "Key64" PRIMARY KEY ("ProductionID")
/

-- Table NewsArticle

CREATE TABLE "NewsArticle"(
  "ArticleID" Integer NOT NULL,
  "Article" Varchar2(1000 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL,
  "MovieID" Integer
)
/

-- Create indexes for table NewsArticle

CREATE INDEX "IX_Relationship14" ON "NewsArticle" ("MovieID")
/

-- Add keys for table NewsArticle

ALTER TABLE "NewsArticle" ADD CONSTRAINT "Key7" PRIMARY KEY ("ArticleID")
/

-- Table SoundMixRef

CREATE TABLE "SoundMixRef"(
  "SoundMixID" Integer NOT NULL,
  "SoundMixName" Varchar2(30 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table SoundMixRef

ALTER TABLE "SoundMixRef" ADD CONSTRAINT "Key62" PRIMARY KEY ("SoundMixID")
/

-- Table Genre

CREATE TABLE "Genre"(
  "GenreID" Integer NOT NULL,
  "Genre" Varchar2(30 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Genre

ALTER TABLE "Genre" ADD CONSTRAINT "Key9" PRIMARY KEY ("GenreID")
/

-- Table MovieTVSoundMix

CREATE TABLE "MovieTVSoundMix"(
  "SoundMixID" Integer NOT NULL,
  "MovieID" Integer,
  "TVShowID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieTVSoundMix

CREATE INDEX "IX_Relationship8" ON "MovieTVSoundMix" ("SoundMixID")
/

CREATE INDEX "IX_Relationship9" ON "MovieTVSoundMix" ("MovieID")
/

CREATE INDEX "IX_Relationship115" ON "MovieTVSoundMix" ("TVShowID")
/

-- Table MovieTVGenre

CREATE TABLE "MovieTVGenre"(
  "GenreID" Integer NOT NULL,
  "MovieID" Integer,
  "TVShowID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieTVGenre

CREATE INDEX "IX_Relationship10" ON "MovieTVGenre" ("GenreID")
/

CREATE INDEX "IX_Relationship11" ON "MovieTVGenre" ("MovieID")
/

CREATE INDEX "IX_Relationship114" ON "MovieTVGenre" ("TVShowID")
/

-- Table AwardType

CREATE TABLE "AwardType"(
  "AwardTypeID" Integer NOT NULL,
  "AwardTypeName" Varchar2(30 ) NOT NULL,
  "Year" Char(4 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table AwardType

ALTER TABLE "AwardType" ADD CONSTRAINT "Key86" PRIMARY KEY ("AwardTypeID")
/

-- Table AwardStatusRef

CREATE TABLE "AwardStatusRef"(
  "StatusID" Integer NOT NULL,
  "Status" Varchar2(30 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table AwardStatusRef

ALTER TABLE "AwardStatusRef" ADD CONSTRAINT "Key83" PRIMARY KEY ("StatusID")
/

-- Table AwardTypeCategory

CREATE TABLE "AwardTypeCategory"(
  "AwardTypeCategoryID" Integer NOT NULL,
  "AwardTypeID" Integer NOT NULL,
  "AwardTypeCategoryName" Varchar2(100 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table AwardTypeCategory

ALTER TABLE "AwardTypeCategory" ADD CONSTRAINT "Key85" PRIMARY KEY ("AwardTypeCategoryID","AwardTypeID")
/

-- Table Award

CREATE TABLE "Award"(
  "AwardID" Integer NOT NULL,
  "AwardTypeCategoryID" Integer NOT NULL,
  "AwardTypeID" Integer NOT NULL,
  "StatusID" Integer,
  "MovieID" Integer,
  "CelebrityID" Integer,
  "Date" Date NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Award

CREATE INDEX "IX_Relationship23" ON "Award" ("AwardTypeCategoryID","AwardTypeID")
/

CREATE INDEX "IX_Relationship24" ON "Award" ("StatusID")
/

CREATE INDEX "IX_Relationship25" ON "Award" ("MovieID")
/

CREATE INDEX "IX_Relationship116" ON "Award" ("CelebrityID")
/

-- Add keys for table Award

ALTER TABLE "Award" ADD CONSTRAINT "Key14" PRIMARY KEY ("AwardID")
/

-- Table Theatre

CREATE TABLE "Theatre"(
  "TheatreID" Integer NOT NULL,
  "AddressID" Integer,
  "Name" Varchar2(50 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Theatre

CREATE INDEX "IX_Relationship128" ON "Theatre" ("AddressID")
/

-- Add keys for table Theatre

ALTER TABLE "Theatre" ADD CONSTRAINT "Key80" PRIMARY KEY ("TheatreID")
/

-- Table ShowTime

CREATE TABLE "ShowTime"(
  "ShowTimeID" Integer NOT NULL,
  "ShowTime" Date NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ShowTime

ALTER TABLE "ShowTime" ADD CONSTRAINT "Key16" PRIMARY KEY ("ShowTimeID")
/

-- Table MovieShowInTheatre

CREATE TABLE "MovieShowInTheatre"(
  "MovieID" Integer NOT NULL,
  "TheatreID" Integer NOT NULL,
  "ScreenID" Integer NOT NULL,
  "ShowDate" Date NOT NULL,
  "ShowTimeID" Integer NOT NULL,
  "ShowPrice" Varchar2(5 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieShowInTheatre

CREATE INDEX "IX_Relationship16" ON "MovieShowInTheatre" ("ShowTimeID")
/

CREATE INDEX "IX_Relationship17" ON "MovieShowInTheatre" ("MovieID")
/

CREATE INDEX "IX_Relationship42" ON "MovieShowInTheatre" ("ShowDate")
/

CREATE INDEX "IX_Relationship123" ON "MovieShowInTheatre" ("ScreenID")
/

CREATE INDEX "IX_Relationship124" ON "MovieShowInTheatre" ("TheatreID")
/

-- Add keys for table MovieShowInTheatre

ALTER TABLE "MovieShowInTheatre" ADD CONSTRAINT "Key79" PRIMARY KEY ("ShowTimeID","MovieID","ShowDate","TheatreID","ScreenID")
/

-- Table Celebrity

CREATE TABLE "Celebrity"(
  "CelebrityID" Integer NOT NULL,
  "Name" Varchar2(50 ) NOT NULL,
  "BirthDate" Date,
  "Gender" Varchar2(10 ),
  "Age" Integer,
  "Rating" Float,
  "BirthPlace" Varchar2(50 ),
  "Height" Varchar2(30 ),
  "StarSign" Varchar2(30 ),
  "AlternateName" Varchar2(50 ),
  "DeathDate" Date,
  "MiniBioData" Varchar2(500 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Celebrity

ALTER TABLE "Celebrity" ADD CONSTRAINT "Key19" PRIMARY KEY ("CelebrityID")
/

-- Table CelebritySpouse

CREATE TABLE "CelebritySpouse"(
  "CelebrityID" Integer NOT NULL,
  "SpouseID" Integer NOT NULL,
  "NoOfChildren" Integer,
  "MarriageDate" Date,
  "DivorceDate" Date,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table CelebritySpouse

CREATE INDEX "IX_Relationship28" ON "CelebritySpouse" ("CelebrityID")
/

CREATE INDEX "IX_Relationship29" ON "CelebritySpouse" ("SpouseID")
/

-- Add keys for table CelebritySpouse

ALTER TABLE "CelebritySpouse" ADD CONSTRAINT "Key78" PRIMARY KEY ("CelebrityID","SpouseID")
/

-- Table TypeOfCelebrity

CREATE TABLE "TypeOfCelebrity"(
  "TypeID" Integer NOT NULL,
  "Type" Varchar2(20 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table TypeOfCelebrity

ALTER TABLE "TypeOfCelebrity" ADD CONSTRAINT "Key73" PRIMARY KEY ("TypeID")
/

-- Table FilmingLocation

CREATE TABLE "FilmingLocation"(
  "LocationID" Integer NOT NULL,
  "Location" Varchar2(25 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table FilmingLocation

ALTER TABLE "FilmingLocation" ADD CONSTRAINT "Key3" PRIMARY KEY ("LocationID")
/

-- Table Spouse

CREATE TABLE "Spouse"(
  "SpouseID" Integer NOT NULL,
  "SpouseName" Varchar2(50 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Spouse

ALTER TABLE "Spouse" ADD CONSTRAINT "Key74" PRIMARY KEY ("SpouseID")
/

-- Table CelebrityType

CREATE TABLE "CelebrityType"(
  "TypeID" Integer NOT NULL,
  "CelebrityID" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table CelebrityType

CREATE INDEX "IX_Relationship31" ON "CelebrityType" ("TypeID")
/

CREATE INDEX "IX_Relationship32" ON "CelebrityType" ("CelebrityID")
/

-- Add keys for table CelebrityType

ALTER TABLE "CelebrityType" ADD CONSTRAINT "Key20" PRIMARY KEY ("TypeID","CelebrityID")
/

-- Table TVShows

CREATE TABLE "TVShows"(
  "TVShowID" Integer NOT NULL,
  "StatusID" Integer,
  "Name" Varchar2(150 ) NOT NULL,
  "Rating" Float,
  "Metascore" Integer,
  "Vote" Integer,
  "Color" Varchar2(20 ),
  "PrintedFilmFormat" Varchar2(500 ),
  "NegativeFormat" Varchar2(500 ),
  "StoryLine" Varchar2(1500 ),
  "AspectRatio" Varchar2(50 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table TVShows

CREATE INDEX "IX_Relationship46" ON "TVShows" ("StatusID")
/

-- Add keys for table TVShows

ALTER TABLE "TVShows" ADD CONSTRAINT "Key96" PRIMARY KEY ("TVShowID")
/

-- Table TVCelebrity

CREATE TABLE "TVCelebrity"(
  "TVShowID" Integer NOT NULL,
  "TypeID" Integer NOT NULL,
  "CelebrityID" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table TVCelebrity

CREATE INDEX "IX_Relationship34" ON "TVCelebrity" ("TVShowID")
/

-- Add keys for table TVCelebrity

ALTER TABLE "TVCelebrity" ADD CONSTRAINT "Key2" PRIMARY KEY ("TVShowID","TypeID","CelebrityID")
/

-- Table TVSeasonShow

CREATE TABLE "TVSeasonShow"(
  "SeasonID" Integer NOT NULL,
  "TVShowID" Integer NOT NULL,
  "UserVotes" Integer,
  "Rating" Float,
  "SeasonNumber" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table TVSeasonShow

ALTER TABLE "TVSeasonShow" ADD CONSTRAINT "Key72" PRIMARY KEY ("SeasonID","TVShowID")
/

-- Table TVShowTime

CREATE TABLE "TVShowTime"(
  "ShowTimeID" Integer NOT NULL,
  "ShowTime" Date NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table TVShowTime

ALTER TABLE "TVShowTime" ADD CONSTRAINT "Key63" PRIMARY KEY ("ShowTimeID")
/

-- Table TVShowOnChannel

CREATE TABLE "TVShowOnChannel"(
  "TVShowID" Integer NOT NULL,
  "ChannelID" Integer NOT NULL,
  "ShowTimeID" Integer NOT NULL,
  "ShowDate" Date,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table TVShowOnChannel

CREATE INDEX "IX_Relationship37" ON "TVShowOnChannel" ("TVShowID")
/

CREATE INDEX "IX_Relationship39" ON "TVShowOnChannel" ("ChannelID")
/

CREATE INDEX "IX_Relationship40" ON "TVShowOnChannel" ("ShowTimeID")
/

CREATE INDEX "IX_Relationship41" ON "TVShowOnChannel" ("ShowDate")
/

-- Add keys for table TVShowOnChannel

ALTER TABLE "TVShowOnChannel" ADD CONSTRAINT "Key65" PRIMARY KEY ("TVShowID","ChannelID","ShowTimeID")
/

-- Table TVShowEpisode

CREATE TABLE "TVShowEpisode"(
  "EpisodeID" Integer NOT NULL,
  "EpisodeNumber" Integer NOT NULL,
  "UserVotes" Integer,
  "Rating" Float,
  "ReleaseDate" Date,
  "SeasonID" Integer NOT NULL,
  "TVShowID" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table TVShowEpisode

ALTER TABLE "TVShowEpisode" ADD CONSTRAINT "Key69" PRIMARY KEY ("EpisodeID","SeasonID","TVShowID")
/

-- Table Channel

CREATE TABLE "Channel"(
  "ChannelID" Integer NOT NULL,
  "Channel" Varchar2(15 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Channel

ALTER TABLE "Channel" ADD CONSTRAINT "Key5" PRIMARY KEY ("ChannelID")
/

-- Table ShowDate

CREATE TABLE "ShowDate"(
  "ShowDate" Date NOT NULL,
  "DayOfWeek" Varchar2(10 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ShowDate

ALTER TABLE "ShowDate" ADD CONSTRAINT "Key21" PRIMARY KEY ("ShowDate")
/

-- Table MovieCelebrity

CREATE TABLE "MovieCelebrity"(
  "MovieID" Integer NOT NULL,
  "TypeID" Integer NOT NULL,
  "CelebrityID" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieCelebrity

CREATE INDEX "IX_Relationship49" ON "MovieCelebrity" ("MovieID")
/

CREATE INDEX "IX_Relationship51" ON "MovieCelebrity" ("TypeID","CelebrityID")
/

-- Add keys for table MovieCelebrity

ALTER TABLE "MovieCelebrity" ADD CONSTRAINT "Key22" PRIMARY KEY ("MovieID","TypeID","CelebrityID")
/

-- Table DiskTypeRef

CREATE TABLE "DiskTypeRef"(
  "DiskTypeID" Integer NOT NULL,
  "DiskType" Varchar2(25 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table DiskTypeRef

ALTER TABLE "DiskTypeRef" ADD CONSTRAINT "Key61" PRIMARY KEY ("DiskTypeID")
/

-- Table Editor

CREATE TABLE "Editor"(
  "EditorID" Integer NOT NULL,
  "EditorName" Varchar2(25 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Editor

ALTER TABLE "Editor" ADD CONSTRAINT "Key11" PRIMARY KEY ("EditorID")
/

-- Table CelebrityNews

CREATE TABLE "CelebrityNews"(
  "CelebrityNewsID" Integer NOT NULL,
  "EditorID" Integer,
  "CelebrityID" Integer,
  "NewsTitle" Varchar2(500 ) NOT NULL,
  "News" Varchar2(1500 ) NOT NULL,
  "UserVote" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table CelebrityNews

CREATE INDEX "IX_Relationship56" ON "CelebrityNews" ("EditorID")
/

CREATE INDEX "IX_Relationship121" ON "CelebrityNews" ("CelebrityID")
/

-- Add keys for table CelebrityNews

ALTER TABLE "CelebrityNews" ADD CONSTRAINT "Key84" PRIMARY KEY ("CelebrityNewsID")
/

-- Table MovieNews

CREATE TABLE "MovieNews"(
  "MovieNewsID" Integer NOT NULL,
  "EditorID" Integer,
  "MovieID" Integer,
  "NewsTitle" Varchar2(500 ) NOT NULL,
  "News" Varchar2(1500 ) NOT NULL,
  "UserVotes" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieNews

CREATE INDEX "IX_Relationship57" ON "MovieNews" ("EditorID")
/

CREATE INDEX "IX_Relationship120" ON "MovieNews" ("MovieID")
/

-- Add keys for table MovieNews

ALTER TABLE "MovieNews" ADD CONSTRAINT "Key82" PRIMARY KEY ("MovieNewsID")
/

-- Table TVNews

CREATE TABLE "TVNews"(
  "TVShowNewsID" Integer NOT NULL,
  "EditorID" Integer,
  "TVShowID" Integer,
  "NewsTitle" Varchar2(500 ) NOT NULL,
  "News" Varchar2(1500 ) NOT NULL,
  "UserVotes" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table TVNews

CREATE INDEX "IX_Relationship58" ON "TVNews" ("EditorID")
/

CREATE INDEX "IX_Relationship122" ON "TVNews" ("TVShowID")
/

-- Add keys for table TVNews

ALTER TABLE "TVNews" ADD CONSTRAINT "Key13" PRIMARY KEY ("TVShowNewsID")
/

-- Table UserPoll

CREATE TABLE "UserPoll"(
  "PollQuestionID" Integer NOT NULL,
  "OptionID" Integer NOT NULL,
  "UserID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table UserPoll

CREATE INDEX "IX_Relationship69" ON "UserPoll" ("PollQuestionID","OptionID")
/

CREATE INDEX "IX_Relationship117" ON "UserPoll" ("UserID")
/

-- Add keys for table UserPoll

ALTER TABLE "UserPoll" ADD CONSTRAINT "Key17" PRIMARY KEY ("PollQuestionID","OptionID")
/

-- Table PollQuestion

CREATE TABLE "PollQuestion"(
  "PollQuestionID" Integer NOT NULL,
  "PostedBy" Varchar2(30 ),
  "PostedOn" Date NOT NULL,
  "UserVotes" Integer,
  "Question" Varchar2(500 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table PollQuestion

ALTER TABLE "PollQuestion" ADD CONSTRAINT "Key15" PRIMARY KEY ("PollQuestionID")
/

-- Table NewsChannel

CREATE TABLE "NewsChannel"(
  "NewsChannelID" Integer NOT NULL,
  "NewsChannelName" Varchar2(25 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL,
  "DateOfCreation" Date
)
/

-- Add keys for table NewsChannel

ALTER TABLE "NewsChannel" ADD CONSTRAINT "Key88" PRIMARY KEY ("NewsChannelID")
/

-- Table IndieNews

CREATE TABLE "IndieNews"(
  "IndieNewsID" Integer NOT NULL,
  "EditorID" Integer,
  "NewsTitle" Varchar2(500 ) NOT NULL,
  "News" Varchar2(1500 ) NOT NULL,
  "UserVotes" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table IndieNews

CREATE INDEX "IX_Relationship59" ON "IndieNews" ("EditorID")
/

-- Add keys for table IndieNews

ALTER TABLE "IndieNews" ADD CONSTRAINT "Key81" PRIMARY KEY ("IndieNewsID")
/

-- Table MovieOrTVDiskType

CREATE TABLE "MovieOrTVDiskType"(
  "DiskTypeID" Integer NOT NULL,
  "MovieID" Integer,
  "TVShowID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieOrTVDiskType

CREATE INDEX "IX_Relationship52" ON "MovieOrTVDiskType" ("DiskTypeID")
/

CREATE INDEX "IX_Relationship54" ON "MovieOrTVDiskType" ("MovieID")
/

CREATE INDEX "IX_Relationship129" ON "MovieOrTVDiskType" ("TVShowID")
/

-- Table NewsOnChannel

CREATE TABLE "NewsOnChannel"(
  "NewsChannelID" Integer NOT NULL,
  "MovieNewsID" Integer,
  "CelebrityNewsID" Integer,
  "TVShowNewsID" Integer,
  "IndieNewsID" Integer,
  "DateAndTimeOfNews" Timestamp(9) NOT NULL,
  "ModifiedDate" Date NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table NewsOnChannel

CREATE INDEX "IX_Relationship62" ON "NewsOnChannel" ("NewsChannelID")
/

CREATE INDEX "IX_Relationship63" ON "NewsOnChannel" ("CelebrityNewsID")
/

CREATE INDEX "IX_Relationship64" ON "NewsOnChannel" ("MovieNewsID")
/

CREATE INDEX "IX_Relationship65" ON "NewsOnChannel" ("TVShowNewsID")
/

CREATE INDEX "IX_Relationship66" ON "NewsOnChannel" ("IndieNewsID")
/

-- Table PollOption

CREATE TABLE "PollOption"(
  "OptionID" Integer NOT NULL,
  "PollQuestionID" Integer NOT NULL,
  "Option" Varchar2(1000 ) NOT NULL,
  "UserVotes" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table PollOption

ALTER TABLE "PollOption" ADD CONSTRAINT "Key25" PRIMARY KEY ("PollQuestionID","OptionID")
/

-- Table Address

CREATE TABLE "Address"(
  "AddressID" Integer NOT NULL,
  "AddressLn1" Varchar2(50 ) NOT NULL,
  "AddressLn2" Varchar2(50 ),
  "PostalCode" Integer NOT NULL,
  "CityID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Address

CREATE INDEX "IX_Relationship3" ON "Address" ("CityID")
/

-- Add keys for table Address

ALTER TABLE "Address" ADD CONSTRAINT "Key93" PRIMARY KEY ("AddressID")
/

-- Table StateProvince

CREATE TABLE "StateProvince"(
  "StateProvinceID" Integer NOT NULL,
  "StateName" Varchar2(25 ) NOT NULL,
  "CountryID" Integer,
  "ModifedDate" Date NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table StateProvince

CREATE INDEX "IX_Relationship1" ON "StateProvince" ("CountryID")
/

-- Add keys for table StateProvince

ALTER TABLE "StateProvince" ADD CONSTRAINT "Key94" PRIMARY KEY ("StateProvinceID")
/

ALTER TABLE "StateProvince" ADD CONSTRAINT "StateName" UNIQUE ("StateName")
/

-- Table City

CREATE TABLE "City"(
  "CityID" Integer NOT NULL,
  "CityName" Varchar2(25 ) NOT NULL,
  "StateProvinceID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table City

CREATE INDEX "IX_Relationship2" ON "City" ("StateProvinceID")
/

-- Add keys for table City

ALTER TABLE "City" ADD CONSTRAINT "Key89" PRIMARY KEY ("CityID")
/

ALTER TABLE "City" ADD CONSTRAINT "CityName" UNIQUE ("CityName")
/

-- Table Country

CREATE TABLE "Country"(
  "CountryID" Integer NOT NULL,
  "CountryName" Varchar2(25 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Country

ALTER TABLE "Country" ADD CONSTRAINT "Key92" PRIMARY KEY ("CountryID")
/

ALTER TABLE "Country" ADD CONSTRAINT "CountryName" UNIQUE ("CountryName")
/

-- Table EmailAddress

CREATE TABLE "EmailAddress"(
  "EmailAddressID" Integer NOT NULL,
  "PersonID" Integer,
  "EmailAddress" Varchar2(50 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table EmailAddress

CREATE INDEX "IX_Relationship6" ON "EmailAddress" ("PersonID")
/

-- Add keys for table EmailAddress

ALTER TABLE "EmailAddress" ADD CONSTRAINT "Key99" PRIMARY KEY ("EmailAddressID")
/

-- Table Phone

CREATE TABLE "Phone"(
  "PhoneID" Integer NOT NULL,
  "PersonID" Integer,
  "PhoneNumber" Varchar2(10 ),
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Phone

CREATE INDEX "IX_Relationship7" ON "Phone" ("PersonID")
/

-- Add keys for table Phone

ALTER TABLE "Phone" ADD CONSTRAINT "Key100" PRIMARY KEY ("PhoneID")
/

-- Table Critics

CREATE TABLE "Critics"(
  "CriticsID" Integer NOT NULL,
  "PersonID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Critics

CREATE INDEX "IX_Relationship126" ON "Critics" ("PersonID")
/

-- Add keys for table Critics

ALTER TABLE "Critics" ADD CONSTRAINT "Key76" PRIMARY KEY ("CriticsID")
/

-- Table PersonAccount

CREATE TABLE "PersonAccount"(
  "PersonID" Integer NOT NULL,
  "UserName" Varchar2(10 ) NOT NULL,
  "AccountNumber" Varchar2(7 ) NOT NULL,
  "Password" Varchar2(50 ) NOT NULL,
  "CreateDate" Date NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table PersonAccount

ALTER TABLE "PersonAccount" ADD CONSTRAINT "Key70" PRIMARY KEY ("PersonID")
/

ALTER TABLE "PersonAccount" ADD CONSTRAINT "AccountNumber" UNIQUE ("AccountNumber")
/

ALTER TABLE "PersonAccount" ADD CONSTRAINT "UserName" UNIQUE ("UserName")
/

-- Table UserDetails

CREATE TABLE "UserDetails"(
  "UserID" Integer NOT NULL,
  "PersonID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table UserDetails

CREATE INDEX "IX_Relationship127" ON "UserDetails" ("PersonID")
/

-- Add keys for table UserDetails

ALTER TABLE "UserDetails" ADD CONSTRAINT "Key66" PRIMARY KEY ("UserID")
/

-- Table AgeType

CREATE TABLE "AgeType"(
  "AgeRangeID" Integer NOT NULL,
  "AgeType" Varchar2(20 ) NOT NULL,
  "AgeRange" Varchar2(30 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table AgeType

ALTER TABLE "AgeType" ADD CONSTRAINT "Key6" PRIMARY KEY ("AgeRangeID")
/

-- Table Person

CREATE TABLE "Person"(
  "PersonID" Integer NOT NULL,
  "AddressID" Integer,
  "AgeRangeID" Integer,
  "FirstName" Varchar2(50 ),
  "LastName" Varchar2(50 ) NOT NULL,
  "Gender" Varchar2(6 ),
  "PersonType" Varchar2(25 ),
  "Age" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table Person

CREATE INDEX "IX_Relationship4" ON "Person" ("AddressID")
/

CREATE INDEX "IX_Relationship15" ON "Person" ("AgeRangeID")
/

-- Add keys for table Person

ALTER TABLE "Person" ADD CONSTRAINT "Key95" PRIMARY KEY ("PersonID")
/

-- Table MessageBoard

CREATE TABLE "MessageBoard"(
  "DiscussionID" Integer NOT NULL,
  "TopicID" Integer,
  "DiscussionContent" Varchar2(100 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL,
  "UserID" Integer
)
/

-- Create indexes for table MessageBoard

CREATE INDEX "IX_Relationship79" ON "MessageBoard" ("TopicID")
/

CREATE INDEX "IX_Relationship80" ON "MessageBoard" ("UserID")
/

-- Add keys for table MessageBoard

ALTER TABLE "MessageBoard" ADD CONSTRAINT "Key90" PRIMARY KEY ("DiscussionID")
/

-- Table MessageBoardCategory

CREATE TABLE "MessageBoardCategory"(
  "CategoryID" Integer NOT NULL,
  "CategoryName" Varchar2(100 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table MessageBoardCategory

ALTER TABLE "MessageBoardCategory" ADD CONSTRAINT "Key91" PRIMARY KEY ("CategoryID")
/

-- Table MessageBoardTopic

CREATE TABLE "MessageBoardTopic"(
  "TopicID" Integer NOT NULL,
  "CategoryID" Integer,
  "TopicName" Varchar2(50 ) NOT NULL,
  "TopicStartDate" Date NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MessageBoardTopic

CREATE INDEX "IX_Relationship78" ON "MessageBoardTopic" ("CategoryID")
/

-- Add keys for table MessageBoardTopic

ALTER TABLE "MessageBoardTopic" ADD CONSTRAINT "Key98" PRIMARY KEY ("TopicID")
/

-- Table UserBooking

CREATE TABLE "UserBooking"(
  "BookingID" Integer NOT NULL,
  "MovieID" Integer NOT NULL,
  "ShowDate" Date NOT NULL,
  "ShowTimeID" Integer NOT NULL,
  "PersonID" Integer NOT NULL,
  "TicketCount" Integer NOT NULL,
  "TotalPrice" Float NOT NULL,
  "DateOfBooking" Date NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL,
  "TheatreID" Integer,
  "ScreenID" Integer
)
/

-- Create indexes for table UserBooking

CREATE INDEX "IX_Relationship72" ON "UserBooking" ("ShowTimeID","MovieID","ShowDate","TheatreID","ScreenID")
/

CREATE INDEX "IX_Relationship77" ON "UserBooking" ("PersonID")
/

-- Add keys for table UserBooking

ALTER TABLE "UserBooking" ADD CONSTRAINT "Key77" PRIMARY KEY ("BookingID")
/

-- Table Screen

CREATE TABLE "Screen"(
  "ScreenID" Integer NOT NULL,
  "Name" Varchar2(10 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Screen

ALTER TABLE "Screen" ADD CONSTRAINT "Key101" PRIMARY KEY ("ScreenID")
/

-- Table ReleaseLanguage

CREATE TABLE "ReleaseLanguage"(
  "LanguageID" Integer NOT NULL,
  "MovieID" Integer,
  "TVShowID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table ReleaseLanguage

CREATE INDEX "IX_Relationship88" ON "ReleaseLanguage" ("LanguageID")
/

CREATE INDEX "IX_Relationship89" ON "ReleaseLanguage" ("MovieID")
/

CREATE INDEX "IX_Relationship90" ON "ReleaseLanguage" ("TVShowID")
/

-- Table BoxOfficeCollectionDate

CREATE TABLE "BoxOfficeCollectionDate"(
  "BoxOfficeCollectionID" Integer NOT NULL,
  "CollectionDate" Date NOT NULL,
  "DayOfWeek" Varchar2(15 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table BoxOfficeCollectionDate

ALTER TABLE "BoxOfficeCollectionDate" ADD CONSTRAINT "Key103" PRIMARY KEY ("BoxOfficeCollectionID")
/

-- Table BoxOfficeCollectionOfMovie

CREATE TABLE "BoxOfficeCollectionOfMovie"(
  "MovieID" Integer NOT NULL,
  "BoxOfficeCollectionID" Integer NOT NULL,
  "CollectionAmount" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table BoxOfficeCollectionOfMovie

CREATE INDEX "IX_Relationship95" ON "BoxOfficeCollectionOfMovie" ("MovieID")
/

CREATE INDEX "IX_Relationship103" ON "BoxOfficeCollectionOfMovie" ("BoxOfficeCollectionID")
/

-- Add keys for table BoxOfficeCollectionOfMovie

ALTER TABLE "BoxOfficeCollectionOfMovie" ADD CONSTRAINT "Key104" PRIMARY KEY ("MovieID","BoxOfficeCollectionID")
/

-- Table ProductionForMovieOrTV

CREATE TABLE "ProductionForMovieOrTV"(
  "ProductionID" Integer NOT NULL,
  "MovieID" Integer,
  "TVShowID" Integer,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table ProductionForMovieOrTV

CREATE INDEX "IX_Relationship96" ON "ProductionForMovieOrTV" ("ProductionID")
/

CREATE INDEX "IX_Relationship97" ON "ProductionForMovieOrTV" ("MovieID")
/

CREATE INDEX "IX_Relationship98" ON "ProductionForMovieOrTV" ("TVShowID")
/

-- Table Certificate

CREATE TABLE "Certificate"(
  "CertificateID" Integer NOT NULL,
  "CertificateName" Varchar2(5 ),
  "Description" Varchar2(100 ) NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Certificate

ALTER TABLE "Certificate" ADD CONSTRAINT "Key106" PRIMARY KEY ("CertificateID")
/

-- Table MovieFilmingLocation

CREATE TABLE "MovieFilmingLocation"(
  "MovieID" Integer NOT NULL,
  "LocationID" Integer NOT NULL,
  "ModifiedDate" Timestamp(9) NOT NULL,
  "ModifiedBy" Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table MovieFilmingLocation

CREATE INDEX "IX_Relationship100" ON "MovieFilmingLocation" ("MovieID")
/

CREATE INDEX "IX_Relationship101" ON "MovieFilmingLocation" ("LocationID")
/

-- Add keys for table MovieFilmingLocation

ALTER TABLE "MovieFilmingLocation" ADD CONSTRAINT "Key107" PRIMARY KEY ("MovieID","LocationID")
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "Movie" ADD CONSTRAINT "Relationship5" FOREIGN KEY ("StatusID") REFERENCES "MovieTVStatusRef" ("StatusID")
/

ALTER TABLE "MovieTVSoundMix" ADD CONSTRAINT "Relationship8" FOREIGN KEY ("SoundMixID") REFERENCES "SoundMixRef" ("SoundMixID")
/

ALTER TABLE "MovieTVSoundMix" ADD CONSTRAINT "Relationship9" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "MovieTVGenre" ADD CONSTRAINT "Relationship10" FOREIGN KEY ("GenreID") REFERENCES "Genre" ("GenreID")
/

ALTER TABLE "MovieTVGenre" ADD CONSTRAINT "Relationship11" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "Review" ADD CONSTRAINT "Relationship12" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "NewsArticle" ADD CONSTRAINT "Relationship14" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "MovieShowInTheatre" ADD CONSTRAINT "Relationship16" FOREIGN KEY ("ShowTimeID") REFERENCES "ShowTime" ("ShowTimeID")
/

ALTER TABLE "MovieShowInTheatre" ADD CONSTRAINT "Relationship17" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "AwardTypeCategory" ADD CONSTRAINT "Relationship22" FOREIGN KEY ("AwardTypeID") REFERENCES "AwardType" ("AwardTypeID")
/

ALTER TABLE "Award" ADD CONSTRAINT "Relationship23" FOREIGN KEY ("AwardTypeCategoryID", "AwardTypeID") REFERENCES "AwardTypeCategory" ("AwardTypeCategoryID", "AwardTypeID")
/

ALTER TABLE "Award" ADD CONSTRAINT "Relationship24" FOREIGN KEY ("StatusID") REFERENCES "AwardStatusRef" ("StatusID")
/

ALTER TABLE "Award" ADD CONSTRAINT "Relationship25" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "CelebritySpouse" ADD CONSTRAINT "Relationship28" FOREIGN KEY ("CelebrityID") REFERENCES "Celebrity" ("CelebrityID")
/

ALTER TABLE "CelebritySpouse" ADD CONSTRAINT "Relationship29" FOREIGN KEY ("SpouseID") REFERENCES "Spouse" ("SpouseID")
/

ALTER TABLE "MovieTrailer" ADD CONSTRAINT "Relationship30" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "CelebrityType" ADD CONSTRAINT "Relationship31" FOREIGN KEY ("TypeID") REFERENCES "TypeOfCelebrity" ("TypeID")
/

ALTER TABLE "CelebrityType" ADD CONSTRAINT "Relationship32" FOREIGN KEY ("CelebrityID") REFERENCES "Celebrity" ("CelebrityID")
/

ALTER TABLE "TVCelebrity" ADD CONSTRAINT "Relationship34" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "TVShowOnChannel" ADD CONSTRAINT "Relationship37" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "TVShowOnChannel" ADD CONSTRAINT "Relationship39" FOREIGN KEY ("ChannelID") REFERENCES "Channel" ("ChannelID")
/

ALTER TABLE "TVShowOnChannel" ADD CONSTRAINT "Relationship40" FOREIGN KEY ("ShowTimeID") REFERENCES "TVShowTime" ("ShowTimeID")
/

ALTER TABLE "TVShowOnChannel" ADD CONSTRAINT "Relationship41" FOREIGN KEY ("ShowDate") REFERENCES "ShowDate" ("ShowDate")
/

ALTER TABLE "MovieShowInTheatre" ADD CONSTRAINT "Relationship42" FOREIGN KEY ("ShowDate") REFERENCES "ShowDate" ("ShowDate")
/

ALTER TABLE "TVSeasonShow" ADD CONSTRAINT "Relationship43" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "TVShowEpisode" ADD CONSTRAINT "Relationship44" FOREIGN KEY ("SeasonID", "TVShowID") REFERENCES "TVSeasonShow" ("SeasonID", "TVShowID")
/

ALTER TABLE "TVShows" ADD CONSTRAINT "Relationship46" FOREIGN KEY ("StatusID") REFERENCES "MovieTVStatusRef" ("StatusID")
/

ALTER TABLE "MovieCelebrity" ADD CONSTRAINT "Relationship49" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "MovieCelebrity" ADD CONSTRAINT "Relationship51" FOREIGN KEY ("TypeID", "CelebrityID") REFERENCES "CelebrityType" ("TypeID", "CelebrityID")
/

ALTER TABLE "MovieOrTVDiskType" ADD CONSTRAINT "Relationship52" FOREIGN KEY ("DiskTypeID") REFERENCES "DiskTypeRef" ("DiskTypeID")
/

ALTER TABLE "MovieOrTVDiskType" ADD CONSTRAINT "Relationship54" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "CelebrityNews" ADD CONSTRAINT "Relationship56" FOREIGN KEY ("EditorID") REFERENCES "Editor" ("EditorID")
/

ALTER TABLE "MovieNews" ADD CONSTRAINT "Relationship57" FOREIGN KEY ("EditorID") REFERENCES "Editor" ("EditorID")
/

ALTER TABLE "TVNews" ADD CONSTRAINT "Relationship58" FOREIGN KEY ("EditorID") REFERENCES "Editor" ("EditorID")
/

ALTER TABLE "IndieNews" ADD CONSTRAINT "Relationship59" FOREIGN KEY ("EditorID") REFERENCES "Editor" ("EditorID")
/

ALTER TABLE "NewsOnChannel" ADD CONSTRAINT "Relationship62" FOREIGN KEY ("NewsChannelID") REFERENCES "NewsChannel" ("NewsChannelID")
/

ALTER TABLE "NewsOnChannel" ADD CONSTRAINT "Relationship63" FOREIGN KEY ("CelebrityNewsID") REFERENCES "CelebrityNews" ("CelebrityNewsID")
/

ALTER TABLE "NewsOnChannel" ADD CONSTRAINT "Relationship64" FOREIGN KEY ("MovieNewsID") REFERENCES "MovieNews" ("MovieNewsID")
/

ALTER TABLE "NewsOnChannel" ADD CONSTRAINT "Relationship65" FOREIGN KEY ("TVShowNewsID") REFERENCES "TVNews" ("TVShowNewsID")
/

ALTER TABLE "NewsOnChannel" ADD CONSTRAINT "Relationship66" FOREIGN KEY ("IndieNewsID") REFERENCES "IndieNews" ("IndieNewsID")
/

ALTER TABLE "PollOption" ADD CONSTRAINT "Relationship68" FOREIGN KEY ("PollQuestionID") REFERENCES "PollQuestion" ("PollQuestionID")
/

ALTER TABLE "UserPoll" ADD CONSTRAINT "Relationship69" FOREIGN KEY ("PollQuestionID", "OptionID") REFERENCES "PollOption" ("PollQuestionID", "OptionID")
/

ALTER TABLE "StateProvince" ADD CONSTRAINT "Relationship1" FOREIGN KEY ("CountryID") REFERENCES "Country" ("CountryID")
/

ALTER TABLE "City" ADD CONSTRAINT "Relationship2" FOREIGN KEY ("StateProvinceID") REFERENCES "StateProvince" ("StateProvinceID")
/

ALTER TABLE "Address" ADD CONSTRAINT "Relationship3" FOREIGN KEY ("CityID") REFERENCES "City" ("CityID")
/

ALTER TABLE "Person" ADD CONSTRAINT "Relationship4" FOREIGN KEY ("AddressID") REFERENCES "Address" ("AddressID")
/

ALTER TABLE "EmailAddress" ADD CONSTRAINT "Relationship18" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "Phone" ADD CONSTRAINT "Relationship7" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "Person" ADD CONSTRAINT "Relationship35" FOREIGN KEY ("AgeRangeID") REFERENCES "AgeType" ("AgeRangeID")
/

ALTER TABLE "UserBooking" ADD CONSTRAINT "Relationship72" FOREIGN KEY ("ShowTimeID", "MovieID", "ShowDate", "TheatreID", "ScreenID") REFERENCES "MovieShowInTheatre" ("ShowTimeID", "MovieID", "ShowDate", "TheatreID", "ScreenID")
/

ALTER TABLE "UserBooking" ADD CONSTRAINT "Relationship77" FOREIGN KEY ("PersonID") REFERENCES "PersonAccount" ("PersonID")
/

ALTER TABLE "MessageBoardTopic" ADD CONSTRAINT "Relationship78" FOREIGN KEY ("CategoryID") REFERENCES "MessageBoardCategory" ("CategoryID")
/

ALTER TABLE "MessageBoard" ADD CONSTRAINT "Relationship79" FOREIGN KEY ("TopicID") REFERENCES "MessageBoardTopic" ("TopicID")
/

ALTER TABLE "MessageBoard" ADD CONSTRAINT "Relationship80" FOREIGN KEY ("UserID") REFERENCES "UserDetails" ("UserID")
/

ALTER TABLE "ReleaseLanguage" ADD CONSTRAINT "Relationship88" FOREIGN KEY ("LanguageID") REFERENCES "Language" ("LanguageID")
/

ALTER TABLE "ReleaseLanguage" ADD CONSTRAINT "Relationship89" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "ReleaseLanguage" ADD CONSTRAINT "Relationship90" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "BoxOfficeCollectionOfMovie" ADD CONSTRAINT "Relationship95" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "ProductionForMovieOrTV" ADD CONSTRAINT "Relationship96" FOREIGN KEY ("ProductionID") REFERENCES "ProductionHouse" ("ProductionID")
/

ALTER TABLE "ProductionForMovieOrTV" ADD CONSTRAINT "Relationship97" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "ProductionForMovieOrTV" ADD CONSTRAINT "Relationship98" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "Movie" ADD CONSTRAINT "Relationship99" FOREIGN KEY ("CertificateID") REFERENCES "Certificate" ("CertificateID")
/

ALTER TABLE "MovieFilmingLocation" ADD CONSTRAINT "Relationship100" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "MovieFilmingLocation" ADD CONSTRAINT "Relationship101" FOREIGN KEY ("LocationID") REFERENCES "FilmingLocation" ("LocationID")
/

ALTER TABLE "Review" ADD CONSTRAINT "Relationship102" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "BoxOfficeCollectionOfMovie" ADD CONSTRAINT "Relationship103" FOREIGN KEY ("BoxOfficeCollectionID") REFERENCES "BoxOfficeCollectionDate" ("BoxOfficeCollectionID")
/

ALTER TABLE "Review" ADD CONSTRAINT "Relationship111" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "PersonAccount" ADD CONSTRAINT "Relationship112" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "TVCelebrity" ADD CONSTRAINT "Relationship113" FOREIGN KEY ("TypeID", "CelebrityID") REFERENCES "CelebrityType" ("TypeID", "CelebrityID")
/

ALTER TABLE "MovieTVGenre" ADD CONSTRAINT "Relationship114" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "MovieTVSoundMix" ADD CONSTRAINT "Relationship115" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "Award" ADD CONSTRAINT "Relationship116" FOREIGN KEY ("CelebrityID") REFERENCES "Celebrity" ("CelebrityID")
/

ALTER TABLE "UserPoll" ADD CONSTRAINT "Relationship117" FOREIGN KEY ("UserID") REFERENCES "UserDetails" ("UserID")
/

ALTER TABLE "MovieNews" ADD CONSTRAINT "Relationship120" FOREIGN KEY ("MovieID") REFERENCES "Movie" ("MovieID")
/

ALTER TABLE "CelebrityNews" ADD CONSTRAINT "Relationship121" FOREIGN KEY ("CelebrityID") REFERENCES "Celebrity" ("CelebrityID")
/

ALTER TABLE "TVNews" ADD CONSTRAINT "Relationship122" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/

ALTER TABLE "MovieShowInTheatre" ADD CONSTRAINT "Relationship123" FOREIGN KEY ("ScreenID") REFERENCES "Screen" ("ScreenID")
/

ALTER TABLE "MovieShowInTheatre" ADD CONSTRAINT "Relationship124" FOREIGN KEY ("TheatreID") REFERENCES "Theatre" ("TheatreID")
/

ALTER TABLE "Critics" ADD CONSTRAINT "Relationship126" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "UserDetails" ADD CONSTRAINT "Relationship127" FOREIGN KEY ("PersonID") REFERENCES "Person" ("PersonID")
/

ALTER TABLE "Theatre" ADD CONSTRAINT "Relationship128" FOREIGN KEY ("AddressID") REFERENCES "Address" ("AddressID")
/

ALTER TABLE "MovieOrTVDiskType" ADD CONSTRAINT "Relationship129" FOREIGN KEY ("TVShowID") REFERENCES "TVShows" ("TVShowID")
/





