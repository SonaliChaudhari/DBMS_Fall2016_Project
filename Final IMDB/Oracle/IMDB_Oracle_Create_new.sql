/*
Created: 26-11-2016
Modified: 04-12-2016
Model: Microsoft SQL Server 2014
Database: MS SQL Server 2014
*/

-- Create tables section -------------------------------------------------

-- Table MOVIES.Movie

CREATE TABLE   Movie 
(
  MovieID  integer NOT NULL,
  StatusID  integer NOT NULL,
  CertificateID  integer NOT NULL,
  Name  VARCHAR2(50) NOT NULL,
  Rating  Float ,
  UserVotes  integer ,
  Metascore  integer ,
  StoryLine  VARCHAR2(500) NOT NULL,
  Runtime  VARCHAR2(50) ,
  Color  VARCHAR2(20) ,
  NegativeFormat  VARCHAR2(100) ,
  Budget  Float NOT NULL,
  IsAmazonAvailableFlag  Raw(1) ,
  ReleaseDate  Date NOT NULL,
  Rank  integer ,
  Camera  VARCHAR2(150) ,
  Laboratory  VARCHAR2(200) ,
  Cinematography  VARCHAR2(200) ,
  PrintedFilmFormat  VARCHAR2(100) ,
  MovieYear  VARCHAR2(4) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.Movie

CREATE INDEX  IX_Relationship5  ON   Movie  ( StatusID );

CREATE INDEX  IX_Relationship99  ON   Movie  ( CertificateID );

-- Add keys for table MOVIES.Movie

ALTER TABLE   Movie  ADD CONSTRAINT  Key97  PRIMARY KEY ( MovieID );

-- Table MOVIES.MovieTrailer

CREATE TABLE   MovieTrailer 
(
  TrailerID  integer NOT NULL,
  Name  VARCHAR2(50) NOT NULL,
  ReleaseDate  Date NOT NULL,
  Rating  Float ,
  TrailerNum  integer NOT NULL,
  MovieID  integer NOT NULL,
  TrailerRunTime  VARCHAR2(20) ,
  TrailerLink  VARCHAR2(100) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.MovieTrailer

CREATE INDEX  IX_Relationship30  ON   MovieTrailer  ( MovieID );

-- Add keys for table MOVIES.MovieTrailer

ALTER TABLE   MovieTrailer  ADD CONSTRAINT  Key75  PRIMARY KEY ( TrailerID );

-- Table MOVIES.MovieTVStatusRef

CREATE TABLE   MovieTVStatusRef 
(
  StatusID  integer NOT NULL,
  Status  VARCHAR2(30) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.MovieTVStatusRef

ALTER TABLE   MovieTVStatusRef  ADD CONSTRAINT  Key71  PRIMARY KEY ( StatusID );

-- Table REVIEW.Review

CREATE TABLE   Review 
(
  ReviewID  integer NOT NULL,
  PersonID  integer NOT NULL,
  MovieID  integer ,
  TVShowID  integer ,
  ReviewType  VARCHAR2(30) NOT NULL,
  Review  VARCHAR2(1500) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table REVIEW.Review

CREATE INDEX  IX_Relationship12  ON   Review  ( MovieID );

CREATE INDEX  IX_Relationship102  ON   Review  ( TVShowID );

CREATE INDEX  IX_Relationship111  ON   Review  ( PersonID );

-- Add keys for table REVIEW.Review

ALTER TABLE   Review  ADD CONSTRAINT  Key68  PRIMARY KEY ( ReviewID );

-- Table MOVIES.Language

CREATE TABLE   Language 
(
  LanguageID  integer NOT NULL,
  Language  VARCHAR2(20) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.Language

ALTER TABLE   Language  ADD CONSTRAINT  Key67  PRIMARY KEY ( LanguageID );

-- Table MOVIES.ProductionHouse

CREATE TABLE   ProductionHouse 
(
  ProductionID  integer NOT NULL,
  ProductioName  VARCHAR2(50) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.ProductionHouse

ALTER TABLE   ProductionHouse  ADD CONSTRAINT  Key64  PRIMARY KEY ( ProductionID );

-- Table NEWS.NewsArticle

CREATE TABLE   NewsArticle 
(
  ArticleID  integer NOT NULL,
  Article  VARCHAR2(1000) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL,
  MovieID  integer NULL
);

-- Create indexes for table NEWS.NewsArticle

CREATE INDEX  IX_Relationship14  ON   NewsArticle  ( MovieID );

-- Add keys for table NEWS.NewsArticle

ALTER TABLE   NewsArticle  ADD CONSTRAINT  Key7  PRIMARY KEY ( ArticleID );

-- Table MOVIES.SoundMixRef

CREATE TABLE   SoundMixRef 
(
  SoundMixID  integer NOT NULL,
  SoundMixName  VARCHAR2(30) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.SoundMixRef

ALTER TABLE   SoundMixRef  ADD CONSTRAINT  Key62  PRIMARY KEY ( SoundMixID );

-- Table MOVIES.Genre

CREATE TABLE   Genre 
(
  GenreID  integer NOT NULL,
  Genre  VARCHAR2(30) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.Genre

ALTER TABLE   Genre  ADD CONSTRAINT  Key9  PRIMARY KEY ( GenreID );

-- Table MOVIES.MovieTVSoundMix

CREATE TABLE   MovieTVSoundMix 
(
  SoundMixID  integer NOT NULL,
  MovieID  integer ,
  TVShowID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.MovieTVSoundMix

CREATE INDEX  IX_Relationship8  ON   MovieTVSoundMix  ( SoundMixID );

CREATE INDEX  IX_Relationship9  ON   MovieTVSoundMix  ( MovieID );

CREATE INDEX  IX_Relationship115  ON   MovieTVSoundMix  ( TVShowID );

-- Table MOVIES.MovieTVGenre

CREATE TABLE   MovieTVGenre 
(
  GenreID  integer NOT NULL,
  MovieID  integer ,
  TVShowID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.MovieTVGenre

CREATE INDEX  IX_Relationship10  ON   MovieTVGenre  ( GenreID );

CREATE INDEX  IX_Relationship11  ON   MovieTVGenre  ( MovieID );

CREATE INDEX  IX_Relationship114  ON   MovieTVGenre  ( TVShowID );

-- Table AWARD.AwardType

CREATE TABLE   AwardType 
(
  AwardTypeID  integer NOT NULL,
  AwardTypeName  VARCHAR2(30) NOT NULL,
  Year  Char(4) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table AWARD.AwardType

ALTER TABLE   AwardType  ADD CONSTRAINT  Key86  PRIMARY KEY ( AwardTypeID );

-- Table AWARD.AwardStatusRef

CREATE TABLE   AwardStatusRef 
(
  StatusID  integer NOT NULL,
  Status  VARCHAR2(30) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table AWARD.AwardStatusRef

ALTER TABLE   AwardStatusRef  ADD CONSTRAINT  Key83  PRIMARY KEY ( StatusID );

-- Table AWARD.AwardTypeCategory

CREATE TABLE   AwardTypeCategory 
(
  AwardTypeCategoryID  integer NOT NULL,
  AwardTypeID  integer NOT NULL,
  AwardTypeCategoryName  VARCHAR2(100) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table AWARD.AwardTypeCategory

ALTER TABLE   AwardTypeCategory  ADD CONSTRAINT  Key85  PRIMARY KEY ( AwardTypeCategoryID , AwardTypeID );

-- Table AWARD.Award

CREATE TABLE   Award 
(
  AwardID  integer NOT NULL,
  AwardTypeCategoryID  integer NOT NULL,
  AwardTypeID  integer NOT NULL,
  StatusID  integer ,
  MovieID  integer ,
  CelebrityID  integer ,
  AwardDate  Date NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table AWARD.Award

CREATE INDEX  IX_Relationship23  ON   Award  ( AwardTypeCategoryID , AwardTypeID );

CREATE INDEX  IX_Relationship24  ON   Award  ( StatusID );

CREATE INDEX  IX_Relationship25  ON   Award  ( MovieID );

CREATE INDEX  IX_Relationship116  ON   Award  ( CelebrityID );

-- Add keys for table AWARD.Award

ALTER TABLE   Award  ADD CONSTRAINT  Key14  PRIMARY KEY ( AwardID );

-- Table MOVIES.Theatre

CREATE TABLE   Theatre 
(
  TheatreID  integer NOT NULL,
  AddressID  integer ,
  Name  VARCHAR2(50) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.Theatre

CREATE INDEX  IX_Relationship128  ON   Theatre  ( AddressID );

-- Add keys for table MOVIES.Theatre

ALTER TABLE   Theatre  ADD CONSTRAINT  Key80  PRIMARY KEY ( TheatreID );

-- Table MOVIES.ShowTime

CREATE TABLE   ShowTime 
(
  ShowTimeID  integer NOT NULL,
  ShowTime  Date NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.ShowTime

ALTER TABLE   ShowTime  ADD CONSTRAINT  Key16  PRIMARY KEY ( ShowTimeID );

-- Table MOVIES.MovieShowInTheatre

CREATE TABLE   MovieShowInTheatre 
(
  MovieID  integer NOT NULL,
  TheatreID  integer NOT NULL,
  ScreenID  integer NOT NULL,
  ShowDate  Date NOT NULL,
  ShowTimeID  integer NOT NULL,
  ShowPrice  VARCHAR2(5) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.MovieShowInTheatre

CREATE INDEX  IX_Relationship16  ON   MovieShowInTheatre  ( ShowTimeID );

CREATE INDEX  IX_Relationship17  ON   MovieShowInTheatre  ( MovieID );

CREATE INDEX  IX_Relationship42  ON   MovieShowInTheatre  ( ShowDate );

CREATE INDEX  IX_Relationship123  ON   MovieShowInTheatre  ( ScreenID );

CREATE INDEX  IX_Relationship124  ON   MovieShowInTheatre  ( TheatreID );

-- Add keys for table MOVIES.MovieShowInTheatre

ALTER TABLE   MovieShowInTheatre  ADD CONSTRAINT  Key79  PRIMARY KEY ( ShowTimeID , MovieID , ShowDate , TheatreID , ScreenID );

-- Table PERSON.Celebrity

CREATE TABLE   Celebrity 
(
  CelebrityID  integer NOT NULL,
  Name  VARCHAR2(50) NOT NULL,
  BirthDate  Date ,
  Gender  VARCHAR2(10) ,
  Age  integer ,
  Rating  Float ,
  BirthPlace  VARCHAR2(50) ,
  Height  VARCHAR2(30) ,
  StarSign  VARCHAR2(30) ,
  AlternateName  VARCHAR2(50) ,
  DeathDate  Date ,
  MiniBioData  VARCHAR2(500) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table PERSON.Celebrity

ALTER TABLE   Celebrity  ADD CONSTRAINT  Key19  PRIMARY KEY ( CelebrityID );

-- Table PERSON.CelebritySpouse

CREATE TABLE   CelebritySpouse 
(
  CelebrityID  integer NOT NULL,
  SpouseID  integer NOT NULL,
  NoOfChildren  integer ,
  MarriageDate  Date ,
  DivorceDate  Date ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.CelebritySpouse

CREATE INDEX  IX_Relationship28  ON   CelebritySpouse  ( CelebrityID );

CREATE INDEX  IX_Relationship29  ON   CelebritySpouse  ( SpouseID );

-- Add keys for table PERSON.CelebritySpouse

ALTER TABLE   CelebritySpouse  ADD CONSTRAINT  Key78  PRIMARY KEY ( CelebrityID , SpouseID );

-- Table PERSON.TypeOfCelebrity

CREATE TABLE   TypeOfCelebrity 
(
  TypeID  integer NOT NULL,
  Type  VARCHAR2(20) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table PERSON.TypeOfCelebrity

ALTER TABLE   TypeOfCelebrity  ADD CONSTRAINT  Key73  PRIMARY KEY ( TypeID );

-- Table MOVIES.FilmingLocation

CREATE TABLE   FilmingLocation 
(
  LocationID  integer NOT NULL,
  Location  VARCHAR2(25) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.FilmingLocation

ALTER TABLE   FilmingLocation  ADD CONSTRAINT  Key3  PRIMARY KEY ( LocationID );

-- Table PERSON.Spouse

CREATE TABLE   Spouse 
(
  SpouseID  integer NOT NULL,
  SpouseName  VARCHAR2(50) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table PERSON.Spouse

ALTER TABLE   Spouse  ADD CONSTRAINT  Key74  PRIMARY KEY ( SpouseID );

-- Table PERSON.CelebrityType

CREATE TABLE   CelebrityType 
(
  TypeID  integer NOT NULL,
  CelebrityID  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.CelebrityType

CREATE INDEX  IX_Relationship31  ON   CelebrityType  ( TypeID );

CREATE INDEX  IX_Relationship32  ON   CelebrityType  ( CelebrityID );

-- Add keys for table PERSON.CelebrityType

ALTER TABLE   CelebrityType  ADD CONSTRAINT  Key20  PRIMARY KEY ( TypeID , CelebrityID );

-- Table TELEVISION.TVShows

CREATE TABLE   TVShows 
(
  TVShowID  integer NOT NULL,
  StatusID  integer ,
  Name  VARCHAR2(150) NOT NULL,
  Rating  Float ,
  Metascore  integer ,
  Vote  integer ,
  Color  VARCHAR2(20) ,
  PrintedFilmFormat  VARCHAR2(500) ,
  NegativeFormat  VARCHAR2(500) ,
  StoryLine  VARCHAR2(1500) ,
  AspectRatio  VARCHAR2(50) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table TELEVISION.TVShows

CREATE INDEX  IX_Relationship46  ON   TVShows  ( StatusID );

-- Add keys for table TELEVISION.TVShows

ALTER TABLE   TVShows  ADD CONSTRAINT  Key96  PRIMARY KEY ( TVShowID );

-- Table TELEVISION.TVCelebrity

CREATE TABLE   TVCelebrity 
(
  TVShowID  integer NOT NULL,
  TypeID  integer NOT NULL,
  CelebrityID  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table TELEVISION.TVCelebrity

CREATE INDEX  IX_Relationship34  ON   TVCelebrity  ( TVShowID );

-- Add keys for table TELEVISION.TVCelebrity

ALTER TABLE   TVCelebrity  ADD CONSTRAINT  Key2  PRIMARY KEY ( TVShowID , TypeID , CelebrityID );

-- Table TELEVISION.TVSeasonShow

CREATE TABLE   TVSeasonShow 
(
  SeasonID  integer NOT NULL,
  TVShowID  integer NOT NULL,
  UserVotes  integer ,
  Rating  Float ,
  SeasonNumber  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table TELEVISION.TVSeasonShow

ALTER TABLE   TVSeasonShow  ADD CONSTRAINT  Key72  PRIMARY KEY ( SeasonID , TVShowID );

-- Table TELEVISION.TVShowTime

CREATE TABLE   TVShowTime 
(
  ShowTimeID  integer NOT NULL,
  ShowTime  Date NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table TELEVISION.TVShowTime

ALTER TABLE   TVShowTime  ADD CONSTRAINT  Key63  PRIMARY KEY ( ShowTimeID );

-- Table TELEVISION.TVShowOnChannel

CREATE TABLE   TVShowOnChannel 
(
  TVShowID  integer NOT NULL,
  ChannelID  integer NOT NULL,
  ShowTimeID  integer NOT NULL,
  ShowDate  Date ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table TELEVISION.TVShowOnChannel

CREATE INDEX  IX_Relationship37  ON   TVShowOnChannel  ( TVShowID );

CREATE INDEX  IX_Relationship39  ON   TVShowOnChannel  ( ChannelID );

CREATE INDEX  IX_Relationship40  ON   TVShowOnChannel  ( ShowTimeID );

CREATE INDEX  IX_Relationship41  ON   TVShowOnChannel  ( ShowDate );

-- Add keys for table TELEVISION.TVShowOnChannel

ALTER TABLE   TVShowOnChannel  ADD CONSTRAINT  Key65  PRIMARY KEY ( TVShowID , ChannelID , ShowTimeID );

-- Table TELEVISION.TVShowEpisode

CREATE TABLE   TVShowEpisode 
(
  EpisodeID  integer NOT NULL,
  EpisodeNumber  integer NOT NULL,
  UserVotes  integer ,
  Rating  Float ,
  ReleaseDate  Date ,
  SeasonID  integer NOT NULL,
  TVShowID  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table TELEVISION.TVShowEpisode

ALTER TABLE   TVShowEpisode  ADD CONSTRAINT  Key69  PRIMARY KEY ( EpisodeID , SeasonID , TVShowID );

-- Table TELEVISION.Channel

CREATE TABLE   Channel 
(
  ChannelID  integer NOT NULL,
  Channel  VARCHAR2(15) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table TELEVISION.Channel

ALTER TABLE   Channel  ADD CONSTRAINT  Key5  PRIMARY KEY ( ChannelID );

-- Table MOVIES.ShowDate

CREATE TABLE   ShowDate 
(
  ShowDate  Date NOT NULL,
  DayOfWeek  VARCHAR2(10) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.ShowDate

ALTER TABLE   ShowDate  ADD CONSTRAINT  Key21  PRIMARY KEY ( ShowDate );

-- Table MOVIES.MovieCelebrity

CREATE TABLE   MovieCelebrity 
(
  MovieID  integer NOT NULL,
  TypeID  integer NOT NULL,
  CelebrityID  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.MovieCelebrity

CREATE INDEX  IX_Relationship49  ON   MovieCelebrity  ( MovieID );

CREATE INDEX  IX_Relationship51  ON   MovieCelebrity  ( TypeID , CelebrityID );

-- Add keys for table MOVIES.MovieCelebrity

ALTER TABLE   MovieCelebrity  ADD CONSTRAINT  Key22  PRIMARY KEY ( MovieID , TypeID , CelebrityID );

-- Table MOVIES.DiskTypeRef

CREATE TABLE   DiskTypeRef 
(
  DiskTypeID  integer NOT NULL,
  DiskType  VARCHAR2(25) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.DiskTypeRef

ALTER TABLE   DiskTypeRef  ADD CONSTRAINT  Key61  PRIMARY KEY ( DiskTypeID );

-- Table NEWS.Editor

CREATE TABLE   Editor 
(
  EditorID  integer NOT NULL,
  EditorName  VARCHAR2(25) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table NEWS.Editor

ALTER TABLE   Editor  ADD CONSTRAINT  Key11  PRIMARY KEY ( EditorID );

-- Table NEWS.CelebrityNews

CREATE TABLE   CelebrityNews 
(
  CelebrityNewsID  integer NOT NULL,
  EditorID  integer ,
  CelebrityID  integer ,
  NewsTitle  VARCHAR2(500) NOT NULL,
  News  VARCHAR2(1500) NOT NULL,
  UserVote  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table NEWS.CelebrityNews

CREATE INDEX  IX_Relationship56  ON   CelebrityNews  ( EditorID );

CREATE INDEX  IX_Relationship121  ON   CelebrityNews  ( CelebrityID );

-- Add keys for table NEWS.CelebrityNews

ALTER TABLE   CelebrityNews  ADD CONSTRAINT  Key84  PRIMARY KEY ( CelebrityNewsID );

-- Table NEWS.MovieNews

CREATE TABLE   MovieNews 
(
  MovieNewsID  integer NOT NULL,
  EditorID  integer ,
  MovieID  integer ,
  NewsTitle  VARCHAR2(500) NOT NULL,
  News  VARCHAR2(1500) NOT NULL,
  UserVotes  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table NEWS.MovieNews

CREATE INDEX  IX_Relationship57  ON   MovieNews  ( EditorID );

CREATE INDEX  IX_Relationship120  ON   MovieNews  ( MovieID );

-- Add keys for table NEWS.MovieNews

ALTER TABLE   MovieNews  ADD CONSTRAINT  Key82  PRIMARY KEY ( MovieNewsID );

-- Table NEWS.TVNews

CREATE TABLE   TVNews 
(
  TVShowNewsID  integer NOT NULL,
  EditorID  integer ,
  TVShowID  integer ,
  NewsTitle  VARCHAR2(500) NOT NULL,
  News  VARCHAR2(1500) NOT NULL,
  UserVotes  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table NEWS.TVNews

CREATE INDEX  IX_Relationship58  ON   TVNews  ( EditorID );

CREATE INDEX  IX_Relationship122  ON   TVNews  ( TVShowID );

-- Add keys for table NEWS.TVNews

ALTER TABLE   TVNews  ADD CONSTRAINT  Key13  PRIMARY KEY ( TVShowNewsID );

-- Table IMDBCOMMUNITY.UserPoll

CREATE TABLE   UserPoll 
(
  PollQuestionID  integer NOT NULL,
  OptionID  integer NOT NULL,
  UserID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table IMDBCOMMUNITY.UserPoll

CREATE INDEX  IX_Relationship69  ON   UserPoll  ( PollQuestionID , OptionID );

CREATE INDEX  IX_Relationship117  ON   UserPoll  ( UserID );

-- Add keys for table IMDBCOMMUNITY.UserPoll

ALTER TABLE   UserPoll  ADD CONSTRAINT  Key17  PRIMARY KEY ( PollQuestionID , OptionID );

-- Table IMDBCOMMUNITY.PollQuestion

CREATE TABLE   PollQuestion 
(
  PollQuestionID  integer NOT NULL,
  PostedBy  VARCHAR2(30) ,
  PostedOn  Date NOT NULL,
  UserVotes  integer ,
  Question  VARCHAR2(500) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table IMDBCOMMUNITY.PollQuestion

ALTER TABLE   PollQuestion  ADD CONSTRAINT  Key15  PRIMARY KEY ( PollQuestionID );

-- Table NEWS.NewsChannel

CREATE TABLE   NewsChannel 
(
  NewsChannelID  integer NOT NULL,
  NewsChannelName  VARCHAR2(25) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL,
  DateOfCreation  Date NULL
);

-- Add keys for table NEWS.NewsChannel

ALTER TABLE   NewsChannel  ADD CONSTRAINT  Key88  PRIMARY KEY ( NewsChannelID );

-- Table NEWS.IndieNews

CREATE TABLE   IndieNews 
(
  IndieNewsID  integer NOT NULL,
  EditorID  integer ,
  NewsTitle  VARCHAR2(500) NOT NULL,
  News  VARCHAR2(1500) NOT NULL,
  UserVotes  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table NEWS.IndieNews

CREATE INDEX  IX_Relationship59  ON   IndieNews  ( EditorID );

-- Add keys for table NEWS.IndieNews

ALTER TABLE   IndieNews  ADD CONSTRAINT  Key81  PRIMARY KEY ( IndieNewsID );

-- Table MOVIES.MovieOrTVDiskType

CREATE TABLE   MovieOrTVDiskType 
(
  DiskTypeID  integer NOT NULL,
  MovieID  integer ,
  TVShowID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.MovieOrTVDiskType

CREATE INDEX  IX_Relationship52  ON   MovieOrTVDiskType  ( DiskTypeID );

CREATE INDEX  IX_Relationship54  ON   MovieOrTVDiskType  ( MovieID );

CREATE INDEX  IX_Relationship129  ON   MovieOrTVDiskType  ( TVShowID );

-- Table NEWS.NewsOnChannel

CREATE TABLE   NewsOnChannel 
(
  NewsChannelID  integer NOT NULL,
  MovieNewsID  integer ,
  CelebrityNewsID  integer ,
  TVShowNewsID  integer ,
  IndieNewsID  integer ,
  DateAndTimeOfNews  TIMESTAMP(9) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table NEWS.NewsOnChannel

CREATE INDEX  IX_Relationship62  ON   NewsOnChannel  ( NewsChannelID );

CREATE INDEX  IX_Relationship63  ON   NewsOnChannel  ( CelebrityNewsID );

CREATE INDEX  IX_Relationship64  ON   NewsOnChannel  ( MovieNewsID );

CREATE INDEX  IX_Relationship65  ON   NewsOnChannel  ( TVShowNewsID );

CREATE INDEX  IX_Relationship66  ON   NewsOnChannel  ( IndieNewsID );

-- Table IMDBCOMMUNITY.PollOption

CREATE TABLE   PollOption 
(
  OptionID  integer NOT NULL,
  PollQuestionID  integer NOT NULL,
  OptionMessage  VARCHAR2(1000) NOT NULL,
  UserVotes  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table IMDBCOMMUNITY.PollOption

ALTER TABLE   PollOption  ADD CONSTRAINT  Key25  PRIMARY KEY ( PollQuestionID , OptionID );

-- Table PERSON.Address

CREATE TABLE   Address 
(
  AddressID  integer NOT NULL,
  AddressLn1  VARCHAR2(50) NOT NULL,
  AddressLn2  VARCHAR2(50) ,
  PostalCode  integer NOT NULL,
  CityID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.Address

CREATE INDEX  IX_Relationship3  ON   Address  ( CityID );

-- Add keys for table PERSON.Address

ALTER TABLE   Address  ADD CONSTRAINT  Key93  PRIMARY KEY ( AddressID );

-- Table PERSON.StateProvince

CREATE TABLE   StateProvince 
(
  StateProvinceID  integer NOT NULL,
  StateName  VARCHAR2(25) NOT NULL,
  CountryID  integer ,
  ModifedDate  Date NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.StateProvince

CREATE INDEX  IX_Relationship1  ON   StateProvince  ( CountryID );

-- Add keys for table PERSON.StateProvince

ALTER TABLE   StateProvince  ADD CONSTRAINT  Key94  PRIMARY KEY ( StateProvinceID );

ALTER TABLE   StateProvince  ADD CONSTRAINT  StateName  UNIQUE ( StateName );

-- Table PERSON.City

CREATE TABLE   City 
(
  CityID  integer NOT NULL,
  CityName  VARCHAR2(25) NOT NULL,
  StateProvinceID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.City

CREATE INDEX  IX_Relationship2  ON   City  ( StateProvinceID );

-- Add keys for table PERSON.City

ALTER TABLE   City  ADD CONSTRAINT  Key89  PRIMARY KEY ( CityID );

ALTER TABLE   City  ADD CONSTRAINT  CityName  UNIQUE ( CityName );

-- Table PERSON.Country

CREATE TABLE   Country 
(
  CountryID  integer NOT NULL,
  CountryName  VARCHAR2(25) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table PERSON.Country

ALTER TABLE   Country  ADD CONSTRAINT  Key92  PRIMARY KEY ( CountryID );

ALTER TABLE   Country  ADD CONSTRAINT  CountryName  UNIQUE ( CountryName );

-- Table PERSON.EmailAddress

CREATE TABLE   EmailAddress 
(
  EmailAddressID  integer NOT NULL,
  PersonID  integer ,
  EmailAddress  VARCHAR2(50) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.EmailAddress

CREATE INDEX  IX_Relationship6  ON   EmailAddress  ( PersonID );

-- Add keys for table PERSON.EmailAddress

ALTER TABLE   EmailAddress  ADD CONSTRAINT  Key99  PRIMARY KEY ( EmailAddressID );

-- Table PERSON.Phone

CREATE TABLE   Phone 
(
  PhoneID  integer NOT NULL,
  PersonID  integer ,
  PhoneNumber  VARCHAR2(10) ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.Phone

CREATE INDEX  IX_Relationship7  ON   Phone  ( PersonID );

-- Add keys for table PERSON.Phone

ALTER TABLE   Phone  ADD CONSTRAINT  Key100  PRIMARY KEY ( PhoneID );

-- Table REVIEW.Critics

CREATE TABLE   Critics 
(
  CriticsID  integer NOT NULL,
  PersonID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table REVIEW.Critics

CREATE INDEX  IX_Relationship126  ON   Critics  ( PersonID );

-- Add keys for table REVIEW.Critics

ALTER TABLE   Critics  ADD CONSTRAINT  Key76  PRIMARY KEY ( CriticsID );

-- Table PERSON.PersonAccount

CREATE TABLE   PersonAccount 
(
  PersonID  integer NOT NULL,
  UserName  VARCHAR2(10) NOT NULL,
  AccountNumber  VARCHAR2(7) NOT NULL,
  Password  VARCHAR2(50) NOT NULL,
  CreateDate  Date NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table PERSON.PersonAccount

ALTER TABLE   PersonAccount  ADD CONSTRAINT  Key70  PRIMARY KEY ( PersonID );

ALTER TABLE   PersonAccount  ADD CONSTRAINT  AccountNumber  UNIQUE ( AccountNumber );

ALTER TABLE   PersonAccount  ADD CONSTRAINT  UserName  UNIQUE ( UserName );

-- Table REVIEW.UserDetails

CREATE TABLE   UserDetails 
(
  UserID  integer NOT NULL,
  PersonID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table REVIEW.UserDetails

CREATE INDEX  IX_Relationship127  ON   UserDetails  ( PersonID );

-- Add keys for table REVIEW.UserDetails

ALTER TABLE   UserDetails  ADD CONSTRAINT  Key66  PRIMARY KEY ( UserID );

-- Table PERSON.AgeType

CREATE TABLE   AgeType 
(
  AgeRangeID  integer NOT NULL,
  AgeType  VARCHAR2(20) NOT NULL,
  AgeRange  VARCHAR2(30) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table PERSON.AgeType

ALTER TABLE   AgeType  ADD CONSTRAINT  Key6  PRIMARY KEY ( AgeRangeID );

-- Table PERSON.Person

CREATE TABLE   Person 
(
  PersonID  integer NOT NULL,
  AddressID  integer ,
  AgeRangeID  integer ,
  FirstName  VARCHAR2(50) ,
  LastName  VARCHAR2(50) NOT NULL,
  Gender  VARCHAR2(6) ,
  PersonType  VARCHAR2(25) ,
  Age  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table PERSON.Person

CREATE INDEX  IX_Relationship4  ON   Person  ( AddressID );

CREATE INDEX  IX_Relationship15  ON   Person  ( AgeRangeID );

-- Add keys for table PERSON.Person

ALTER TABLE   Person  ADD CONSTRAINT  Key95  PRIMARY KEY ( PersonID );

-- Table IMDBCOMMUNITY.MessageBoard

CREATE TABLE   MessageBoard 
(
  DiscussionID  integer NOT NULL,
  TopicID  integer ,
  DiscussionContent  VARCHAR2(100) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL,
  UserID  integer NULL
);

-- Create indexes for table IMDBCOMMUNITY.MessageBoard

CREATE INDEX  IX_Relationship79  ON   MessageBoard  ( TopicID );

CREATE INDEX  IX_Relationship80  ON   MessageBoard  ( UserID );

-- Add keys for table IMDBCOMMUNITY.MessageBoard

ALTER TABLE   MessageBoard  ADD CONSTRAINT  Key90  PRIMARY KEY ( DiscussionID );

-- Table IMDBCOMMUNITY.MessageBoardCategory

CREATE TABLE   MessageBoardCategory 
(
  CategoryID  integer NOT NULL,
  CategoryName  VARCHAR2(100) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table IMDBCOMMUNITY.MessageBoardCategory

ALTER TABLE   MessageBoardCategory  ADD CONSTRAINT  Key91  PRIMARY KEY ( CategoryID );

-- Table IMDBCOMMUNITY.MessageBoardTopic

CREATE TABLE   MessageBoardTopic 
(
  TopicID  integer NOT NULL,
  CategoryID  integer ,
  TopicName  VARCHAR2(50) NOT NULL,
  TopicStartDate  Date NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table IMDBCOMMUNITY.MessageBoardTopic

CREATE INDEX  IX_Relationship78  ON   MessageBoardTopic  ( CategoryID );

-- Add keys for table IMDBCOMMUNITY.MessageBoardTopic

ALTER TABLE   MessageBoardTopic  ADD CONSTRAINT  Key98  PRIMARY KEY ( TopicID );

-- Table MOVIES.UserBooking

CREATE TABLE   UserBooking 
(
  BookingID  integer NOT NULL,
  MovieID  integer NOT NULL,
  ShowDate  Date NOT NULL,
  ShowTimeID  integer NOT NULL,
  PersonID  integer NOT NULL,
  TicketCount  integer NOT NULL,
  TotalPrice  Float NOT NULL,
  DateOfBooking  Date NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL,
  TheatreID  integer ,
  ScreenID  integer NULL
);

-- Create indexes for table MOVIES.UserBooking

CREATE INDEX  IX_Relationship72  ON   UserBooking  ( ShowTimeID , MovieID , ShowDate , TheatreID , ScreenID );

CREATE INDEX  IX_Relationship77  ON   UserBooking  ( PersonID );

-- Add keys for table MOVIES.UserBooking

ALTER TABLE   UserBooking  ADD CONSTRAINT  Key77  PRIMARY KEY ( BookingID );

-- Table MOVIES.Screen

CREATE TABLE   Screen 
(
  ScreenID  integer NOT NULL,
  Name  VARCHAR2(10) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.Screen

ALTER TABLE   Screen  ADD CONSTRAINT  Key101  PRIMARY KEY ( ScreenID );

-- Table MOVIES.ReleaseLanguage

CREATE TABLE   ReleaseLanguage 
(
  LanguageID  integer NOT NULL,
  MovieID  integer ,
  TVShowID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.ReleaseLanguage

CREATE INDEX  IX_Relationship88  ON   ReleaseLanguage  ( LanguageID );

CREATE INDEX  IX_Relationship89  ON   ReleaseLanguage  ( MovieID );

CREATE INDEX  IX_Relationship90  ON   ReleaseLanguage  ( TVShowID );

-- Table MOVIES.BoxOfficeCollectionDate

CREATE TABLE   BoxOfficeCollectionDate 
(
  BoxOfficeCollectionID  integer NOT NULL,
  CollectionDate  Date NOT NULL,
  DayOfWeek  VARCHAR2(15) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.BoxOfficeCollectionDate

ALTER TABLE   BoxOfficeCollectionDate  ADD CONSTRAINT  Key103  PRIMARY KEY ( BoxOfficeCollectionID );

-- Table MOVIES.BoxOfficeCollectionOfMovie

CREATE TABLE   BoxOfficeCollectionOfMovie 
(
  MovieID  integer NOT NULL,
  BoxOfficeCollectionID  integer NOT NULL,
  CollectionAmount  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.BoxOfficeCollectionOfMovie

CREATE INDEX  IX_Relationship95  ON   BoxOfficeCollectionOfMovie  ( MovieID );

CREATE INDEX  IX_Relationship103  ON   BoxOfficeCollectionOfMovie  ( BoxOfficeCollectionID );

-- Add keys for table MOVIES.BoxOfficeCollectionOfMovie

ALTER TABLE   BoxOfficeCollectionOfMovie  ADD CONSTRAINT  Key104  PRIMARY KEY ( MovieID , BoxOfficeCollectionID );

-- Table MOVIES.ProductionForMovieOrTV

CREATE TABLE   ProductionForMovieOrTV 
(
  ProductionID  integer NOT NULL,
  MovieID  integer ,
  TVShowID  integer ,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.ProductionForMovieOrTV

CREATE INDEX  IX_Relationship96  ON   ProductionForMovieOrTV  ( ProductionID );

CREATE INDEX  IX_Relationship97  ON   ProductionForMovieOrTV  ( MovieID );

CREATE INDEX  IX_Relationship98  ON   ProductionForMovieOrTV  ( TVShowID );

-- Table MOVIES.Certificate

CREATE TABLE   Certificate 
(
  CertificateID  integer NOT NULL,
  CertificateName  VARCHAR2(5) ,
  Description  VARCHAR2(100) NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Add keys for table MOVIES.Certificate

ALTER TABLE   Certificate  ADD CONSTRAINT  Key106  PRIMARY KEY ( CertificateID );

-- Table MOVIES.MovieFilmingLocation

CREATE TABLE   MovieFilmingLocation 
(
  MovieID  integer NOT NULL,
  LocationID  integer NOT NULL,
  ModifiedDate Timestamp(9) NOT NULL,
  ModifiedBy  VARCHAR2(30) NOT NULL
);

-- Create indexes for table MOVIES.MovieFilmingLocation

CREATE INDEX  IX_Relationship100  ON   MovieFilmingLocation  ( MovieID );

CREATE INDEX  IX_Relationship101  ON   MovieFilmingLocation  ( LocationID );

-- Add keys for table MOVIES.MovieFilmingLocation

ALTER TABLE   MovieFilmingLocation  ADD CONSTRAINT  Key107  PRIMARY KEY ( MovieID , LocationID );

-- Create relationships section ------------------------------------------------- 

ALTER TABLE   Movie  ADD CONSTRAINT  Relationship5  FOREIGN KEY ( StatusID ) REFERENCES   MovieTVStatusRef  ( StatusID );


ALTER TABLE   MovieTVSoundMix  ADD CONSTRAINT  Relationship8  FOREIGN KEY ( SoundMixID ) REFERENCES   SoundMixRef  ( SoundMixID ) ;

ALTER TABLE   MovieTVSoundMix  ADD CONSTRAINT  Relationship9  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   MovieTVGenre  ADD CONSTRAINT  Relationship10  FOREIGN KEY ( GenreID ) REFERENCES   Genre  ( GenreID ) ;

ALTER TABLE   MovieTVGenre  ADD CONSTRAINT  Relationship11  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   Review  ADD CONSTRAINT  Relationship12  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   NewsArticle  ADD CONSTRAINT  Relationship14  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   MovieShowInTheatre  ADD CONSTRAINT  Relationship16  FOREIGN KEY ( ShowTimeID ) REFERENCES   ShowTime  ( ShowTimeID ) ;

ALTER TABLE   MovieShowInTheatre  ADD CONSTRAINT  Relationship17  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   AwardTypeCategory  ADD CONSTRAINT  Relationship22  FOREIGN KEY ( AwardTypeID ) REFERENCES   AwardType  ( AwardTypeID ) ;

ALTER TABLE   Award  ADD CONSTRAINT  Relationship23  FOREIGN KEY ( AwardTypeCategoryID ,  AwardTypeID ) REFERENCES   AwardTypeCategory  ( AwardTypeCategoryID ,  AwardTypeID ) ;

ALTER TABLE   Award  ADD CONSTRAINT  Relationship24  FOREIGN KEY ( StatusID ) REFERENCES   AwardStatusRef  ( StatusID ) ;

ALTER TABLE   Award  ADD CONSTRAINT  Relationship25  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   CelebritySpouse  ADD CONSTRAINT  Relationship28  FOREIGN KEY ( CelebrityID ) REFERENCES   Celebrity  ( CelebrityID ) ;

ALTER TABLE   CelebritySpouse  ADD CONSTRAINT  Relationship29  FOREIGN KEY ( SpouseID ) REFERENCES   Spouse  ( SpouseID ) ;

ALTER TABLE   MovieTrailer  ADD CONSTRAINT  Relationship30  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   CelebrityType  ADD CONSTRAINT  Relationship31  FOREIGN KEY ( TypeID ) REFERENCES   TypeOfCelebrity  ( TypeID ) ;

ALTER TABLE   CelebrityType  ADD CONSTRAINT  Relationship32  FOREIGN KEY ( CelebrityID ) REFERENCES   Celebrity  ( CelebrityID ) ;

ALTER TABLE   TVCelebrity  ADD CONSTRAINT  Relationship34  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   TVShowOnChannel  ADD CONSTRAINT  Relationship37  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   TVShowOnChannel  ADD CONSTRAINT  Relationship39  FOREIGN KEY ( ChannelID ) REFERENCES   Channel  ( ChannelID ) ;

ALTER TABLE   TVShowOnChannel  ADD CONSTRAINT  Relationship40  FOREIGN KEY ( ShowTimeID ) REFERENCES   TVShowTime  ( ShowTimeID ) ;

ALTER TABLE   TVShowOnChannel  ADD CONSTRAINT  Relationship41  FOREIGN KEY ( ShowDate ) REFERENCES   ShowDate  ( ShowDate ) ;

ALTER TABLE   MovieShowInTheatre  ADD CONSTRAINT  Relationship42  FOREIGN KEY ( ShowDate ) REFERENCES   ShowDate  ( ShowDate ) ;

ALTER TABLE   TVSeasonShow  ADD CONSTRAINT  Relationship43  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   TVShowEpisode  ADD CONSTRAINT  Relationship44  FOREIGN KEY ( SeasonID ,  TVShowID ) REFERENCES   TVSeasonShow  ( SeasonID ,  TVShowID ) ;

ALTER TABLE   TVShows  ADD CONSTRAINT  Relationship46  FOREIGN KEY ( StatusID ) REFERENCES   MovieTVStatusRef  ( StatusID ) ;

ALTER TABLE   MovieCelebrity  ADD CONSTRAINT  Relationship49  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   MovieCelebrity  ADD CONSTRAINT  Relationship51  FOREIGN KEY ( TypeID ,  CelebrityID ) REFERENCES   CelebrityType  ( TypeID ,  CelebrityID ) ;

ALTER TABLE   MovieOrTVDiskType  ADD CONSTRAINT  Relationship52  FOREIGN KEY ( DiskTypeID ) REFERENCES   DiskTypeRef  ( DiskTypeID ) ;

ALTER TABLE   MovieOrTVDiskType  ADD CONSTRAINT  Relationship54  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   CelebrityNews  ADD CONSTRAINT  Relationship56  FOREIGN KEY ( EditorID ) REFERENCES   Editor  ( EditorID ) ;

ALTER TABLE   MovieNews  ADD CONSTRAINT  Relationship57  FOREIGN KEY ( EditorID ) REFERENCES   Editor  ( EditorID ) ;

ALTER TABLE   TVNews  ADD CONSTRAINT  Relationship58  FOREIGN KEY ( EditorID ) REFERENCES   Editor  ( EditorID ) ;

ALTER TABLE   IndieNews  ADD CONSTRAINT  Relationship59  FOREIGN KEY ( EditorID ) REFERENCES   Editor  ( EditorID ) ;

ALTER TABLE   NewsOnChannel  ADD CONSTRAINT  Relationship62  FOREIGN KEY ( NewsChannelID ) REFERENCES   NewsChannel  ( NewsChannelID ) ;

ALTER TABLE   NewsOnChannel  ADD CONSTRAINT  Relationship63  FOREIGN KEY ( CelebrityNewsID ) REFERENCES   CelebrityNews  ( CelebrityNewsID ) ;

ALTER TABLE   NewsOnChannel  ADD CONSTRAINT  Relationship64  FOREIGN KEY ( MovieNewsID ) REFERENCES   MovieNews  ( MovieNewsID ) ;

ALTER TABLE   NewsOnChannel  ADD CONSTRAINT  Relationship65  FOREIGN KEY ( TVShowNewsID ) REFERENCES   TVNews  ( TVShowNewsID ) ;

ALTER TABLE   NewsOnChannel  ADD CONSTRAINT  Relationship66  FOREIGN KEY ( IndieNewsID ) REFERENCES   IndieNews  ( IndieNewsID ) ;

ALTER TABLE   PollOption  ADD CONSTRAINT  Relationship68  FOREIGN KEY ( PollQuestionID ) REFERENCES   PollQuestion  ( PollQuestionID ) ;

ALTER TABLE   UserPoll  ADD CONSTRAINT  Relationship69  FOREIGN KEY ( PollQuestionID ,  OptionID ) REFERENCES   PollOption  ( PollQuestionID ,  OptionID ) ;

ALTER TABLE   StateProvince  ADD CONSTRAINT  Relationship1  FOREIGN KEY ( CountryID ) REFERENCES   Country  ( CountryID ) ;

ALTER TABLE   City  ADD CONSTRAINT  Relationship2  FOREIGN KEY ( StateProvinceID ) REFERENCES   StateProvince  ( StateProvinceID ) ;

ALTER TABLE   Address  ADD CONSTRAINT  Relationship3  FOREIGN KEY ( CityID ) REFERENCES   City  ( CityID ) ;

ALTER TABLE   Person  ADD CONSTRAINT  Relationship4  FOREIGN KEY ( AddressID ) REFERENCES   Address  ( AddressID ) ;

ALTER TABLE   EmailAddress  ADD CONSTRAINT  Relationship18  FOREIGN KEY ( PersonID ) REFERENCES   Person  ( PersonID ) ;

ALTER TABLE   Phone  ADD CONSTRAINT  Relationship7  FOREIGN KEY ( PersonID ) REFERENCES   Person  ( PersonID ) ;

ALTER TABLE   Person  ADD CONSTRAINT  Relationship35  FOREIGN KEY ( AgeRangeID ) REFERENCES   AgeType  ( AgeRangeID ) ;

ALTER TABLE   UserBooking  ADD CONSTRAINT  Relationship72  FOREIGN KEY ( ShowTimeID ,  MovieID ,  ShowDate ,  TheatreID ,  ScreenID ) REFERENCES   MovieShowInTheatre  ( ShowTimeID ,  MovieID ,  ShowDate ,  TheatreID ,  ScreenID ) ;

ALTER TABLE   UserBooking  ADD CONSTRAINT  Relationship77  FOREIGN KEY ( PersonID ) REFERENCES   PersonAccount  ( PersonID ) ;

ALTER TABLE   MessageBoardTopic  ADD CONSTRAINT  Relationship78  FOREIGN KEY ( CategoryID ) REFERENCES   MessageBoardCategory  ( CategoryID ) ;

ALTER TABLE   MessageBoard  ADD CONSTRAINT  Relationship79  FOREIGN KEY ( TopicID ) REFERENCES   MessageBoardTopic  ( TopicID ) ;

ALTER TABLE   MessageBoard  ADD CONSTRAINT  Relationship80  FOREIGN KEY ( UserID ) REFERENCES   UserDetails  ( UserID ) ;

ALTER TABLE   ReleaseLanguage  ADD CONSTRAINT  Relationship88  FOREIGN KEY ( LanguageID ) REFERENCES   Language  ( LanguageID ) ;

ALTER TABLE   ReleaseLanguage  ADD CONSTRAINT  Relationship89  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   ReleaseLanguage  ADD CONSTRAINT  Relationship90  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   BoxOfficeCollectionOfMovie  ADD CONSTRAINT  Relationship95  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   ProductionForMovieOrTV  ADD CONSTRAINT  Relationship96  FOREIGN KEY ( ProductionID ) REFERENCES   ProductionHouse  ( ProductionID ) ;

ALTER TABLE   ProductionForMovieOrTV  ADD CONSTRAINT  Relationship97  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   ProductionForMovieOrTV  ADD CONSTRAINT  Relationship98  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   Movie  ADD CONSTRAINT  Relationship99  FOREIGN KEY ( CertificateID ) REFERENCES   Certificate  ( CertificateID ) ;

ALTER TABLE   MovieFilmingLocation  ADD CONSTRAINT  Relationship100  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   MovieFilmingLocation  ADD CONSTRAINT  Relationship101  FOREIGN KEY ( LocationID ) REFERENCES   FilmingLocation  ( LocationID ) ;

ALTER TABLE   Review  ADD CONSTRAINT  Relationship102  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   BoxOfficeCollectionOfMovie  ADD CONSTRAINT  Relationship103  FOREIGN KEY ( BoxOfficeCollectionID ) REFERENCES   BoxOfficeCollectionDate  ( BoxOfficeCollectionID ) ;

ALTER TABLE   Review  ADD CONSTRAINT  Relationship111  FOREIGN KEY ( PersonID ) REFERENCES   Person  ( PersonID ) ;

ALTER TABLE   PersonAccount  ADD CONSTRAINT  Relationship112  FOREIGN KEY ( PersonID ) REFERENCES   Person  ( PersonID ) ;

ALTER TABLE   TVCelebrity  ADD CONSTRAINT  Relationship113  FOREIGN KEY ( TypeID ,  CelebrityID ) REFERENCES   CelebrityType  ( TypeID ,  CelebrityID ) ;

ALTER TABLE   MovieTVGenre  ADD CONSTRAINT  Relationship114  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   MovieTVSoundMix  ADD CONSTRAINT  Relationship115  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   Award  ADD CONSTRAINT  Relationship116  FOREIGN KEY ( CelebrityID ) REFERENCES   Celebrity  ( CelebrityID ) ;

ALTER TABLE   UserPoll  ADD CONSTRAINT  Relationship117  FOREIGN KEY ( UserID ) REFERENCES   UserDetails  ( UserID ) ;

ALTER TABLE   MovieNews  ADD CONSTRAINT  Relationship120  FOREIGN KEY ( MovieID ) REFERENCES   Movie  ( MovieID ) ;

ALTER TABLE   CelebrityNews  ADD CONSTRAINT  Relationship121  FOREIGN KEY ( CelebrityID ) REFERENCES   Celebrity  ( CelebrityID ) ;

ALTER TABLE   TVNews  ADD CONSTRAINT  Relationship122  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;

ALTER TABLE   MovieShowInTheatre  ADD CONSTRAINT  Relationship123  FOREIGN KEY ( ScreenID ) REFERENCES   Screen  ( ScreenID ) ;

ALTER TABLE   MovieShowInTheatre  ADD CONSTRAINT  Relationship124  FOREIGN KEY ( TheatreID ) REFERENCES   Theatre  ( TheatreID ) ;

ALTER TABLE   Critics  ADD CONSTRAINT  Relationship126  FOREIGN KEY ( PersonID ) REFERENCES   Person  ( PersonID ) ;

ALTER TABLE   UserDetails  ADD CONSTRAINT  Relationship127  FOREIGN KEY ( PersonID ) REFERENCES   Person  ( PersonID ) ;

ALTER TABLE   Theatre  ADD CONSTRAINT  Relationship128  FOREIGN KEY ( AddressID ) REFERENCES   Address  ( AddressID ) ;

ALTER TABLE   MovieOrTVDiskType  ADD CONSTRAINT  Relationship129  FOREIGN KEY ( TVShowID ) REFERENCES   TVShows  ( TVShowID ) ;




---------------------------------------------------------------------------------------------------------------------------
===========================================================================================================================

ALTER TABLE Movie MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieTrailer MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieTVStatusRef MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Review MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Language MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE ProductionHouse MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE NewsArticle MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE SoundMixRef MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Genre MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieTVSoundMix MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieTVGenre MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE AwardType MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE AwardStatusRef MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE AwardTypeCategory MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Award MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Theatre MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE ShowTime MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieShowInTheatre MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Celebrity MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE CelebritySpouse MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TypeOfCelebrity MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE FilmingLocation MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Spouse MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE CelebrityType MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TVShows MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TVCelebrity MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TVSeasonShow MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TVShowTime MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TVShowOnChannel MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TVShowEpisode MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Channel MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE ShowDate MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieCelebrity MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE DiskTypeRef MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Editor MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE CelebrityNews MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieNews MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE TVNews MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE UserPoll MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE PollQuestion MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE NewsChannel MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE IndieNews MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieOrTVDiskType MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE NewsOnChannel MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE PollOption MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Address MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE StateProvince MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE City MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Country MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE EmailAddress MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Phone MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Critics MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE PersonAccount MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE UserDetails MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE AgeType MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Person MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MessageBoard MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MessageBoardCategory MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MessageBoardTopic MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE UserBooking MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Screen MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE ReleaseLanguage MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE BoxOfficeCollectionDate MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE BoxOfficeCollectionOfMovie MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE ProductionForMovieOrTV MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE Certificate MODIFY  ModifiedDate Timestamp(9);
ALTER TABLE MovieFilmingLocation MODIFY  ModifiedDate Timestamp(9);






